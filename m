From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 07 Apr 2016 06:49:15 +0200
Subject: [Buildroot] [PATCH] ipmitool: fix musl build
In-Reply-To: <5702E4E7.1060705@mind.be>
References: <1459620764-7241-1-git-send-email-joerg.krause@embedded.rocks>
 <5702E4E7.1060705@mind.be>
Message-ID: <1460004555.2035.14.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

many thanks for the review!

On Di, 2016-04-05 at 00:04 +0200, Arnout Vandecappelle wrote:
> On 04/02/16 20:12, J?rg Krause wrote:
> > 
> > Add two patches to fix musl build.
> > 
> > The first patch avoids the redefinition aof wchar_t. The second
> > patch adds a
> > missing header include of <linux/params.h>.
> > 
> > Both patches send upstream:
> > https://sourceforge.net/p/ipmitool/mailman/message/34987103/
> > https://sourceforge.net/p/ipmitool/mailman/message/34987104/
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/75f/75fd6f1be0271bb15078c62f
> > 3effdbb67ac07427/
> > http://autobuild.buildroot.net/results/cac/cacf8179a9c8142eef695624
> > 62d3c3b0b20c2879/
> > http://autobuild.buildroot.net/results/c10/c1045882947ff7150c750088
> > ae1981bd99134c54/
> > http://autobuild.buildroot.net/results/6a7/6a770f8a3dddb15ba4d95555
> > e74b198799278dcf/
> > .. and more.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > ? .../ipmitool/0001-Avoid-wchar_t-redefinition.patch | 35
> > +++++++++++++++++++
> > ? ...-Add-missing-linux-param.h-header-include.patch | 39
> > ++++++++++++++++++++++
> > ? 2 files changed, 74 insertions(+)
> > ? create mode 100644 package/ipmitool/0001-Avoid-wchar_t-
> > redefinition.patch
> > ? create mode 100644 package/ipmitool/0002-Add-missing-linux-
> > param.h-header-include.patch
> > 
> > diff --git a/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch 
> > b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
> > new file mode 100644
> > index 0000000..f404245
> > --- /dev/null
> > +++ b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
> > @@ -0,0 +1,35 @@
> > +From ea30d9b4290009116f11bb7110d1ac13589d76a4 Mon Sep 17 00:00:00
> > 2001
> > +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> > +Date: Sat, 2 Apr 2016 19:45:14 +0200
> > +Subject: [PATCH 1/2] Avoid wchar_t redefinition
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +The musl C library does not define _WCHAR_T. Check also for
> > compiler defined
> > +__WCHAR_TYPE__.
> > +
> > +Upstream status: Pending
> > +https://sourceforge.net/p/ipmitool/mailman/message/34987103/
> > +
> > +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > +---
> > + src/plugins/imb/imbapi.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
> > +index 74975c6..fa1e9c6 100644
> > +--- a/src/plugins/imb/imbapi.h
> > ++++ b/src/plugins/imb/imbapi.h
> > +@@ -46,7 +46,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> > SUCH DAMAGE.
> > + #endif
> > + #ifndef WIN32
> > + /* WIN32 defines this in stdio.h */
> > +-#ifndef _WCHAR_T
> > ++#if !defined(_WCHAR_T) && !defined(__WCHAR_TYPE__)
> ? __WCHAR_TYPE_ is also not a standardized macro.

Yes, it's not standardized. It's a common predefined macro and so a GNU
C extension.

> For example, does clang define?
> it?

Yes, Clang defines it [1].

> The proper solution is to add an autoconf test for wchar and use
> that?
> define. Take for example m4/wchar_t.m4 from bison.

I did not find m4/wchar_t in the bison git tree, but for some other
projects. I'm not very experienced in autotools, but
wouldn't?AC_CHECK_TYPES(wchar_t) be sufficient?

[1]?http://clang.llvm.org/doxygen/stddef_8h.html

Best regards
J?rg Krause
