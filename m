From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 17:12:02 +0200
Subject: [Buildroot] [PATCH 09/15] package/pkg-python: Remove
 _sysconfigdata*.pyc files when _sysconfigdata*.py are changed
In-Reply-To: <20210621141130.48654-10-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-10-herve.codina@bootlin.com>
Message-ID: <20210621171202.2362cb27@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 16:11:24 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> In order to avoid _sysconfigdata*.pyc overwrites when they are generated based on
> _sysconfigdata*.py changes, this commit simply removes _sysconfigdata*.pyc
> whenever _sysconfigdata*.py are changed.
> 
> As they are removed, overwrite detection will no longer trig and coherency between
> the two files (.py and .pyc) is ensured.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  package/pkg-python.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 59a48e5a87..b3fde77da5 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -96,7 +96,9 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  define PKG_PYTHON_FIXUP_SYSCONFIGDATA
>  	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
>  		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
> -		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
> +		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g" ;\

The semicolon + backslash is not needed, these two commands can (I
believe) be executed as separate shell commands.

> +	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
> +		-name "_sysconfigdata*.pyc" -print0 | xargs -0 -r rm -f

Do we need a --no-run-if-empty on the xargs ? Or perhaps it should be
using find directly, i.e:

	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
		-name "_sysconfigdata*.pyc" -exec rm -f {} \;

(or something like that)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
