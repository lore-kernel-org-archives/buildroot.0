From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 22:18:30 +0200
Subject: [Buildroot] [PATCH 01/12] toolchain-external: instrument
 wrapper to warn about unsafe paths
In-Reply-To: <20140910194239.GB4155@free.fr>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140910194239.GB4155@free.fr>
Message-ID: <20140910221830.5e94360a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, 10 Sep 2014 21:42:39 +0200, Yann E. MORIN wrote:

> At long last, here is a preliminary review of this series...

Thanks a lot for looking into this!

> > +static void check_unsafe_path(const char *path, int paranoid)
> > +{
> > +	char **c;
> > +	char *unsafe_paths[] = {
> > +		"/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
> 
> Make it a global variable, or at least a static one.

Right.

> > +	};
> > +
> > +	for (c = unsafe_paths; *c != NULL; c++) {
> > +		if (!strncmp(path, *c, strlen(*c))) {
> > +			fprintf(stderr, "%s: unsafe header/library path used in cross-compilation: '%s'\n",
> > +				paranoid ? "ERROR" : "WARNING", path);
> 
> It could be nice to also print the name of the executable that is
> running, something like:
> 
>     fprintf(stderr,"%s: %s: unsafe....'%s'\n",
>             program_invocation_short_name,
>             paranoid ? "ERROR" : "WARNING", path);
> 
> program_invocation_short_name is a glibcism, so it would only work on
> glibc, or Clibc with the option enabled. Also requires:
>     #define _GNU_SOURCE
>     #include <errno.h>

Right, ok.

> > +		/* We handle two cases: first the case where -I/-L and
> > +		 * the path are separated by one space and therefore
> > +		 * visible as two separate options, and then the case
> > +		 * where they are stuck together forming one single
> > +		 * option.
> > +		 */
> > +		if (strlen(argv[i]) == 2) {
> 
> argv[*] are passed by the user, so better not trust them. What about:
> 
>     if (argv[i][2]!='\0') {
>         ...;
>     }

This makes an assumption on the length of argv[i], which is even worse,
IMO. I don't see why strlen(argv[i]) would be unsafe, actually.

> > +			if (i == argc)
> > +				continue;
> 
> 'i' can not be == argc, because 'i' is an array index, and argc is the
> number of entries in the array. If you want to test whether that's the
> last argument, you should do:
> 
>     if (i+1 == argc) { ...; }
> 
> or:
>     i++;
>     if (i == argc) { ...; }
> 
> I think the second option is better, since that way you also skip
> re-testign that argv in the next loop.
> 
> Also, I'd use break instead of continue, since the loop is finished
> anyway.

Right, good point.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
