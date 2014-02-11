From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 09:18:55 +0100
Subject: [Buildroot] [RFC PATCH] toolchain-external: instrument wrapper
 to warn about unsafe paths
In-Reply-To: <20140211003326.GH5239@free.fr>
References: <1392074881-12508-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140211003326.GH5239@free.fr>
Message-ID: <20140211091855.00e6c483@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 11 Feb 2014 01:33:27 +0100, Yann E. MORIN wrote:

> > Optionally, if BR_PARANOID_WRAPPER is defined in the environment, the
> > external wrapper will instead error out and abort the compilation. We
> > could then one day imagine setting this BR_PARANOID_WRAPPER in the
> > autobuilders.
> 
> I think I'd prefer we do as for BR_DEBUG_WRAPPER:
>     BR2_PARANOID_WRAPPER undefined or empty: nothing
>     BR2_PARANOID_WRAPPER=WARNING           : warning
>     BR2_PARANOID_WRAPPER=ERROR             : error out

Sure, I don't have any particular feeling about this. However, I would
maybe like to have this feature enabled as the warning level by default.

> Side-note: BR_DEBUG_WRAPPER should probably be renamed to
> BR2_DEBUG_WRAPPER, to follow the newly-stated naming scheme, no?

If I understood the newly-stated naming scheme, yes, I believe you're
right, it should be renamed BR2_DEBUG_WRAPPER.

> > A similar change could be made to the internal toolchain backend
> > either by making it use a wrapper like the external toolchain one, or
> > by adding some patches to gcc, by borrowing the changes made by the
> > CodeSourcery people.
> 
> Maybe it would be best to not duplicate this, and always use the
> wrapper, even for the internal backend?

Which is exactly one of the two solutions I proposed in the paragraph
you're quoting :-)

> 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  .../toolchain-external/ext-toolchain-wrapper.c     | 27 ++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> > index 81c6ed1..c8dcad5 100644
> > --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> > +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> > @@ -77,6 +77,7 @@ int main(int argc, char **argv)
> >  	char *progpath = argv[0];
> >  	char *basename;
> >  	char *env_debug;
> > +	char *paranoid_wrapper;
> >  	int ret, i, count = 0, debug;
> >  
> >  	/* Calculate the relative paths */
> > @@ -178,6 +179,32 @@ int main(int argc, char **argv)
> >  	}
> >  #endif /* ARCH || TUNE || CPU */
> >  
> > +	paranoid_wrapper = getenv("BR_PARANOID_WRAPPER");
> > +
> > +	/* Check for unsafe library and header paths */
> > +	for (i = 1; i < argc; i++) {
> > +		if (!strncmp(argv[i], "-I/usr", strlen("-I/usr")) ||
> > +		    !strncmp(argv[i], "-L/usr", strlen("-L/usr"))) {
> 
> No need for strncmp: you're comparing to a constant, so it will not
> overflow.

I need strncmp here: I want to match only the first characters of
argv[i]. I.e, the above condition should match:

	-I/usr/bar
	-L/usr/local/foo
	-I/usr/include/mysql

etc. If I use strcmp(), it is going to compare the entire string, and
-I/usr/include/mysql is not the same as -I/usr.

> Also, using strlen on an argument of strncmp is flawed to begin with.

Weird, a certain Yann E. Morin did exactly this in
http://git.buildroot.net/buildroot/commit/toolchain/toolchain-external/ext-toolchain-wrapper.c?id=2c1dc32647eb308126b0ae80a91988059d39aa7b :-)

> For  strncmp(a, b, strlen(b)) :
>   - if 'b' is a constant, there's no need for strncmp to begin with
>   - if 'b' is a user-supplied value, strlen will happily go west, and
>     will not protect strncmp anyway.

You miss the case where you use strncmp() to only match the first N
characters of the string. Which is both what I'm doing here, and what
your patch for -march, -mtune and -mcpu is doing.

> > +			fprintf(stderr, "%s: unsafe header/library path used in cross-compilation: '%s'\n",
> > +				paranoid_wrapper ? "ERROR" : "WARNING", argv[i]);
> > +			if (paranoid_wrapper)
> > +				exit(1);
> > +			continue;
> > +		}
> > +
> > +		if (!strcmp(argv[i], "-L") || !strcmp(argv[i], "-I")) {
> 
> And here you're using strcmp.

Yes, because I'm matching the entire string.

> 
> > +			if (i == argc)
> > +				continue;
> > +			if (!strncmp(argv[i+1], "/usr", strlen("/usr"))) {
> 
> Ditto strncmp.

Yes because I want to match only the beginning of the string, so that
this condition together with the above matches:

	-I /usr/include/mysql
	-L /usr/foo

> Otherwise, I like the idea pretty much! :-)

Me too :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
