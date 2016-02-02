From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 16:23:04 +0100
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: fix musl build
In-Reply-To: <1454235429-6713-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454235429-6713-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C9D8.9000904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 11:17, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/a15/a1586717154efb6495dfcdb5c7ce11a047dd68db/
> http://autobuild.buildroot.net/results/363/3636ddcc0efa974c674f36d3c65eea5beb32af52/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
> v2: hopefully fixed patch comment (Thomas)
> 
>  ...Invert-conditional-for-defining-QT_SOCKLE.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
> 
> diff --git a/package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
> new file mode 100644
> index 0000000..97be739
> --- /dev/null
> +++ b/package/qt5/qt5base/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
> @@ -0,0 +1,40 @@
> +From 8f09897de948cea8861ca95e182f442cf15a339e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 8 Jun 2015 13:59:25 -0700
> +Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
> +
> +This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
> +only when its glibc < 2 and not also for the libraries which may define
> +it as per standards but are not glibc, e.g. musl
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +[Bernd: Downloaded from
> +https://github.com/meta-qt5/meta-qt5/blob/d9d1d04760430cd0e5edd1764d832860715e7b83/recipes-qt/qt5/qtbase/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
> +and adjusted path.]
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
> +index dd12003..8623651 100644
> +--- a/mkspecs/linux-g++/qplatformdefs.h
> ++++ b/mkspecs/linux-g++/qplatformdefs.h
> +@@ -86,10 +86,10 @@
> + 
> + #undef QT_SOCKLEN_T
> + 
> +-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
> +-#define QT_SOCKLEN_T            socklen_t
> +-#else
> ++#if defined(__GLIBC__) && (__GLIBC__ < 2)
> + #define QT_SOCKLEN_T            int
> ++#else
> ++#define QT_SOCKLEN_T            socklen_t
> + #endif
> + 
> + #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
> +-- 
> +2.1.4
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
