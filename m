From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 6 Jan 2016 11:56:17 -0300
Subject: [Buildroot] [PATCH] libnss: add build workaround for older gcc
 versions
In-Reply-To: <20160106155444.34e63384@free-electrons.com>
References: <1452089934-10364-1-git-send-email-gustavo@zacarias.com.ar>
 <20160106155444.34e63384@free-electrons.com>
Message-ID: <568D2B11.3030701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/16 11:54, Thomas Petazzoni wrote:

> Hello,
>
> On Wed,  6 Jan 2016 11:18:54 -0300, Gustavo Zacarias wrote:
>> nss uses some #pragma directives that require newish (>= 4.6) versions
>> of gcc, so disable Werror when building with older versions to avoid the
>> build from breaking unfairly.
>> However make this a gcc >= 4.8 conditional since the kludge is called so
>> (NSS_NO_GCC48) and other bits might depend upon it.
>
> Here you say the kludge is called NSS_NO_GCC48, but...
>
>> +# #pragma usage needs gcc >= 4.8
>> +# See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
>> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),)
>> +LIBNSS_BUILD_VARS += NSS_ENABLE_WERROR=0
>> +endif
>
> here you use NSS_ENABLE_WERROR.
>
> Is it me misunderstanding your commit message?

Hi.
Well, maybe i wasn't clear.
The public kludge is NSS_ENABLE_WERROR, which triggers are build define 
NSS_NO_GCC48 (which is what we're interested in), but however we can't 
def that directly from the outside, hence we use NSS_ENABLE_WERROR=0 
(which sets the other one).
Regards.
