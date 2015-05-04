From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 May 2015 22:19:23 +0200
Subject: [Buildroot] [PATCH v3 4/4] autobuild-run: set locale to en_US
 or C
In-Reply-To: <1430084873-19977-5-git-send-email-dywi@mailerd.de>
References: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
 <1430084873-19977-5-git-send-email-dywi@mailerd.de>
Message-ID: <20150504221923.6714df0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Sun, 26 Apr 2015 23:47:53 +0200, Andr? Erdmann wrote:
> some python scripts break if the locale is set to C, try en_US first
> 
> Additionally, drop all locale env vars (LC_*, LANG[GUAGE]) when
> setting the new locale.
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
> ---
>  scripts/autobuild-run | 47 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 4 deletions(-)

This commit looks very, very complicated. What is the original problem
exactly? You say "some python scripts break", but that isn't a very
precise description.

> +    def set_locale(self):
> +        def is_locale_env_varname(w):
> +            return w.startswith('LC_') or w in ['LANG', 'LANGUAGE']
> +
> +        ret, locales_str = self.run_cmd_get_stdout(["locale", "-a"])
> +        if ret != os.EX_OK:
> +            return False
> +
> +        # create a dict
> +        #   <locale identifier> (as listed in TRY_LOCALES) => <locale env name>
> +        locales = dict((
> +            (k.lower().replace("-", ""), k) for k in locales_str.split()
> +        ))
> +
> +        for loc_key in filter(lambda x: x in locales, self.TRY_LOCALES):
> +            # cannot modify self.env while iterating over it,
> +            #  create intermediate list
> +            env_old_locale_keys = [
> +                k for k in self.env.keys() if is_locale_env_varname(k)
> +            ]
> +            for k in env_old_locale_keys:
> +                del self.env[k]
> +
> +            # set new locale once
> +            for vname in self.LOCALE_KEYS:
> +                self.env[vname] = locales[loc_key]
> +            return True
> +        # -- end for
> +        # practically impossible to reach this return if 'c' is in TRY_LOCALES:
> +        return None

There's really nothing simpler than this mess?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
