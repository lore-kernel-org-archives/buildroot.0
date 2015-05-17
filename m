From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 09:00:01 +0200
Subject: [Buildroot] [PATCH v2 3/3] qt: fix webkit dependencies
In-Reply-To: <1429958478-29114-3-git-send-email-gwenj@trabucayre.com>
 (Gwenhael Goavec-Merou's message of "Sat, 25 Apr 2015 12:41:18 +0200")
References: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
 <1429958478-29114-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <87h9rb8z9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > fix:
 > http://autobuild.buildroot.net/results/ce8/ce89ad1ca6aec9f7bb5549301bf4c0dcba9e0e37/

 > qtwebkit includes qscript headers. 
 > For packages like python-pyqt if webkit is available but not qscript, the
 > compilation fails with :
 > buildroot/output/build/python-pyqt-4.11.3/sip/QtWebKit/qwebframe.sip:79:0:
 > ../../../host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/QtWebKit/qwebframe.h:28:36:
 > 	fatal error: QtScript/qscriptengine.h: No such file or directory

 > This problem is not seen with Qt compilation because some relative include
 > directly from sources are added.

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > ---
 >  package/qt/Config.in | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/qt/Config.in b/package/qt/Config.in
 > index 43f5a0f..f6ca054 100644
 > --- a/package/qt/Config.in
 > +++ b/package/qt/Config.in
 > @@ -417,6 +417,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
 >  config BR2_PACKAGE_QT_WEBKIT
 >  	bool "WebKit Module"
 > +	depends on BR2_PACKAGE_QT_SCRIPT
 >  	depends on BR2_PACKAGE_QT_SHARED
 >  	depends on BR2_PACKAGE_QT_GUI_MODULE
 >  	depends on BR2_PACKAGE_QT_NETWORK
 > @@ -427,7 +428,8 @@ config BR2_PACKAGE_QT_WEBKIT
 >  	  If unsure, say n.
 
 >  comment "WebKit needs shared library/NPTL toolchain/gui/network support"
 > -	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
 > +	depends on !(BR2_PACKAGE_QT_SCRIPT && BR2_PACKAGE_QT_SHARED && \
 > +		BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)

You forgot to update the comment to mention the script module.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
