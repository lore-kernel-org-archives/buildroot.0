From: Alan Ott <alan@signal11.us>
Date: Sun, 12 Oct 2014 11:22:53 -0400
Subject: [Buildroot] [PATCH] python-pyqt: new package
In-Reply-To: <CAGtNMfN5y9yU3P9E+cS=1XySGK=S1n_XKPkc9=gfzZ0eaiqv9w@mail.gmail.com>
References: <1382190416-9928-1-git-send-email-sergey.kostanbaev@gmail.com>
 <CAGtNMfN5y9yU3P9E+cS=1XySGK=S1n_XKPkc9=gfzZ0eaiqv9w@mail.gmail.com>
Message-ID: <543A9CCD.6010006@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/2014 02:04 PM, sergey kostanbaev wrote:
> Any comments about my patches (python-sip and python-pyqt)? Is 
> something wrong with them?

Hi Sergey,

Sorry for so much delay in looking at this. I tried out your patches 
today and have the following comments:

1. Your python-sip.mk builds both the sip executable and the sip library 
using the target compiler and installs both into $(TARGET_DIR). Since 
the sip executable is used to generate C++ code which must be compiled, 
it doesn't make sense to install the sip executable on the target. The 
library needs to go in $(TARGET_DIR) (and be built with the target 
compiler), and the sip executable needs to go in $(HOST_DIR) (and be 
built with the host compiler).

2. When building pyqt, if the sip executable is not installed on the 
host system, the build will fail, since it can't use the target-compiled 
sip executable built by the python-sip package (because of #1 above).

3. As you said in your email comments, you are generating the 
qtdetail.out file based on the buildroot configuration. This makes 
sense, but there is a case it isn't considering. If you don't select 
BR2_PACKAGE_QT_LICENSE_APPROVED from menuconfig, buildroot will prompt 
you to select a QT license from the console during the build. If you do 
it that way, BR2_PACKAGE_QT_LICENSE_APPROVED will _not_ get set, and 
then python-pyqt.mk will not generate a qtdetail.out that pyqt's 
configure-ng.py can properly parse, causing pyqt's configure-ng.py to 
fail with "Error: Qt has been built as static libraries so either the 
--consolidate or --static argument should be used." This error message, 
while seemingly unrelated, comes as a result of the way the 
configure-ng.py parses the qtdetail.out (by splitting the lines into an 
array and reading lines by hard-coded index, which fails when there is 
an empty line at the beginning).

4. After consulting with Thomas Petazzoni and Arnout Vandecappelle, we 
think the config item for python-sip (packages/Config.in) should go 
under "python external modules" instead of under Qt in the menu.

So I guess it comes down to:
1. Make sure it builds without sip being installed on the host system
2. Make sure it builds when "Approve Free License" 
(BR2_PACKAGE_QT_LICENSE_APPROVED) is not set in the configuration.

Thanks for the patch. This looks like it was a lot of work.

Alan.
