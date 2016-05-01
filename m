From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 23:22:27 +0200
Subject: [Buildroot] [PATCH v3 6/9] python-pygame: bump version to fix
 Python 3 byte-compilation issue
In-Reply-To: <1462133720-409-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+F8XzmFgz4RQax8yr+E9-4hcmUtRf7O0NN7AkOJrj=9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, May 1, 2016 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The current version of python-pygame in Buildroot does not
> byte-compile properly with Python 3. Commit 22efec0b44da from upstream
> fixes the problem, so we take this opportunity to bump the pygame
> version.
>
> Fixing byte-compilation is necessary as we will soon enable a
> mechanism that aborts the build in case of error during the
> byte-compilation process (while they are today considered as
> warnings).
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/python-pygame/python-pygame.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
> index 995f80a..1ef2bdf 100644
> --- a/package/python-pygame/python-pygame.mk
> +++ b/package/python-pygame/python-pygame.mk
> @@ -6,7 +6,7 @@
>
>  # stable 1.9.1 release requires V4L which has been wiped out of recent Linux
>  # kernels, so use latest mercurial revision until next stable release is out.
> -PYTHON_PYGAME_VERSION = f0bb4a4b365d
> +PYTHON_PYGAME_VERSION = d61ea8eabd56
>  PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
>  PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
>  PYTHON_PYGAME_SITE_METHOD = hg
> @@ -66,6 +66,10 @@ define PYTHON_PYGAME_UNCONFIGURE_SCRAP
>  endef
>  endif
>
> +define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
> +       $(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
> +endef
Note that in version f0bb4a4b365d, _freetype stuff was already there
but disable.
(see https://bitbucket.org/pygame/pygame/commits/0a3be7313aa4)

> +
>  PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
>  PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
>
> @@ -82,6 +86,7 @@ define PYTHON_PYGAME_CONFIGURE_CMDS
>         $(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
>         $(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
>         $(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
> +       $(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)
>  endef
>
>  define PYTHON_PYGAME_REMOVE_DOC
> --
> 2.7.4
>

Regards,

-- 
Samuel
