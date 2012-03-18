From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 17:49:29 +0100
Subject: [Buildroot] [PATCH 5/5] manual: update Config.in dependency
	explainations
In-Reply-To: <1332060843-2786-6-git-send-email-s.martin49@gmail.com>
References: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
 <1332060843-2786-6-git-send-email-s.martin49@gmail.com>
Message-ID: <201203181749.29769.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 18 March 2012 09:54:03 Samuel MARTIN wrote:
> 
> Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
> ---
>  docs/manual/adding-packages-directory.txt |   39 +++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 04be820..75ef763 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -87,6 +87,45 @@ comment "acl requires a toolchain with LARGEFILE support"
>  --------------------------
>  
>  
> +Note that these two dependency types are only transitive with the
> +dependencies of the same kind.
> +
> +This means, in the following example:
> +
> +--------------------------
> +config PACKAGE_A
 I would use BR2_PACKAGE_* in the example.

> +        bool "Package A"
> +
> +config PACKAGE_B
> +        bool "Package B"
> +        depends on PACKAGE_A
> +
> +config PACKAGE_C
> +        bool "Package C"
> +        depends on PACKAGE_B
> +
> +config PACKAGE_D
> +        bool "Package D"
> +        select PACKAGE_B
> +
> +config PACKAGE_E
> +        bool "Package E"
> +        select PACKAGE_D
> +--------------------------
> +
> +* Selecting +Package C+ will be visible if +Package B+ has been
> +  selected, so if +Package A+ has been selected too.

 Rewrite:

Selecting +Package C+ will be visible if +Package B+ has been
selected, which in turn is only visible if +Package A+ has been selected.

> +
> +* Selecting +Package E+ will select +Package D+, which will select
> +  +Package B+, it will not check for the dependencies of +Package B+,
> +  so it will not select +Package A+.

 Add:

Since +Package B+ is selected but +Package A+ is not, this violates 
the dependency of +Package B+ on +Package A+.  Therefore, in such a 
situation, the transitive dependency has to be added explicitly.

--------------------------
config PACKAGE_D
	bool "Package D"
	select PACKAGE_B
	depends on PACKAGE_A

config PACKAGE_E
	bool "Package E"
	select PACKAGE_D
	depends on PACKAGE_A
--------------------------


> +
> +Overall, for package library dependencies, +select+ should be
> +prefered.

 My spell checker prefers preferred :-)

> +
> +One should avoid to mix up these two dependency types, though it
> +should be adapted to each case.

 I think this paragraph makes things more confusing instead of more
clear.  Perhaps just remove it?


 Regards,
 Arnout

> +
>  Note that such dependencies will make sure that the dependency option
>  is also enabled, but not necessarily built before your package. To do
>  so, the dependency also needs to be expressed in the +.mk+ file of the
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
