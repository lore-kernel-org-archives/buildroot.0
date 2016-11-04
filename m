From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Nov 2016 10:22:36 +0100
Subject: [Buildroot] [PATCH 1/2] python: improve reproducability
In-Reply-To: <1478222971-2250-1-git-send-email-danomimanchego123@gmail.com>
References: <1478222971-2250-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20161104102236.539630d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 21:29:30 -0400, Danomi Manchego wrote:
> The readline and hashlib options work simply by adding dependencies;
> there is no specific configure switch for them.  Therefore, if those
> external dependencies are selected independent of python, then they
> can affect its compilation.  So if those packages are selected outside
> of python, make them go first.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/python/python.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index cc65376..8c51d23 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -60,7 +60,7 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
>  
>  PYTHON_INSTALL_STAGING = YES
>  
> -ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
> +ifneq ($(BR2_PACKAGE_PYTHON_READLINE)$(BR2_PACKAGE_READLINE),)
>  PYTHON_DEPENDENCIES += readline
>  endif

I understand the problem, but I don't really like the solution. Indeed,
when BR2_PACKAGE_PYTHON_READLINE is disabled, I expect readline support
to not be enabled in Python, regardless of whether BR2_PACKAGE_READLINE
is enabled or not. Perhaps we should add the relevant
--enable/--disable options, like we have for various other Python
optional dependencies?

Otherwise, we could just as well remove those options altogether.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
