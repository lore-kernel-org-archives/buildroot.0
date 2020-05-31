From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 May 2020 09:52:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: fix build with gcc <= 5
In-Reply-To: <20200530095115.3213648-1-fontaine.fabrice@gmail.com>
References: <20200530095115.3213648-1-fontaine.fabrice@gmail.com>
Message-ID: <20200531075232.GW8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-30 11:51 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after expanding the commit log slightly to add a
blurb that nullptr and NULL are usualy not interchangeable.

Please do not forget to send upstream. ;-)

Regards,
Yann E. MORIN.

> ---
>  ...mp4track.cpp-replace-nullptr-by-NULL.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> 
> diff --git a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> new file mode 100644
> index 0000000000..91074c8b74
> --- /dev/null
> +++ b/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> @@ -0,0 +1,45 @@
> +From 78cf76b5d661e37e958163c37c0ad95940c09591 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 30 May 2020 11:42:19 +0200
> +Subject: [PATCH] src/mp4track.cpp: replace nullptr by NULL
> +
> +Commit 15ec11166ba9ee7b77631d0d9234522f656cfd66 added code that uses
> +nullptr. nullptr is C++11, it will break the build with older gcc so
> +switch back to NULL
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + src/mp4track.cpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/mp4track.cpp b/src/mp4track.cpp
> +index 4b8fc9d..42489eb 100644
> +--- a/src/mp4track.cpp
> ++++ b/src/mp4track.cpp
> +@@ -908,16 +908,16 @@ File* MP4Track::GetSampleFile( MP4SampleId sampleId )
> +        MP4FtypAtom *pFtypAtom = reinterpret_cast<MP4FtypAtom *>( m_File.FindAtom( "ftyp" ) );
> + 
> +        // MOV spec does not require "ftyp" atom...
> +-       if ( pFtypAtom == nullptr )
> ++       if ( pFtypAtom == NULL )
> +        {
> +-          return nullptr;
> ++          return NULL;
> +        }
> +        else
> +        {
> +           // ... but most often it is present with a "qt  " value
> +           const char *majorBrand = pFtypAtom->majorBrand.GetValue();
> +           if ( ::strcmp( pFtypAtom->majorBrand.GetValue(), "qt  " ) == 0 )
> +-             return nullptr;
> ++             return NULL;
> +        }
> +        throw new Exception( "invalid stsd entry", __FILE__, __LINE__, __FUNCTION__ );
> +     }
> +-- 
> +2.26.2
> +
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
