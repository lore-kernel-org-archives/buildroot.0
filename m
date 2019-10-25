From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 11:00:53 +0200
Subject: [Buildroot] [PATCH 1/1] check-package: add version format check
In-Reply-To: <20191025081459.32429-1-heiko.thiery@gmail.com>
References: <20191025081459.32429-1-heiko.thiery@gmail.com>
Message-ID: <20191025110053.6e1d14e2@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Oct 2019 10:15:00 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> To meet the requirement of "Anitya", the tool used by
> https://release-monitoring.org/, the <pkg>_VERSION variable
> should not contain a prefix 'v'.

Wow, that was fast! Thanks!

> +class Version(_CheckFunction):
> +    VERSION = re.compile(r"^([A-Z0-9_]+)_VERSION\s*[\+|:|]*=\s*(.*)")
> +    GIT_HASH = re.compile("([A-Za-f0-9]{40})")
> +
> +    def _is_git_hash(self, value):
> +        return True if self.GIT_HASH.match(value) else False
> +
> +    def check_line(self, lineno, text):
> +        m = self.VERSION.search(text)
> +        if m is None:
> +            return
> +
> +        variable, assignment = m.group(1, 2)
> +
> +        if self._is_git_hash(assignment):
> +            return

Do we really need this check? After all, we're checking below if it
starts with "v" and "v" is not a valid digit in hexadecimal, so it will
never appear in a Git hash, so a Git hash will anyway never match the
below condition "version starts with v".

> +        if assignment.startswith('v'):

The only concern I have with such a "simple" approach is what if
someone creates a package like this:

FOO_SITE = git://git.somewhere.com
FOO_VERSION = very-last-tag-before-1.0-release

Of course, that's a very stupid Git tag name, but I guess you see my
point: are there cases where a version starting with "v" would be valid?

That's why I was suggesting something like a check that it looks like
"vX.Y.Z". As Arnout said, it could be "vX-Y-Z". Perhaps we should check
for "v[0-9]" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
