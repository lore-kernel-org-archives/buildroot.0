From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Aug 2016 16:54:09 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/wrapper: display options
 leading to a paranoid failure
In-Reply-To: <20160824163656.5d08599f@free-electrons.com>
References: <1472048370-20408-1-git-send-email-yann.morin.1998@free.fr>
 <20160824163656.5d08599f@free-electrons.com>
Message-ID: <20160824145409.GB5730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-24 16:36 +0200, Thomas Petazzoni spake thusly:
> On Wed, 24 Aug 2016 16:19:29 +0200, Yann E. MORIN wrote:
> > Current, we only display the path that causes the paranoid failure. This
> > is sufficient, as we can fail only for -I and -L options, and it is thus
> > easy to infer from the path, which option is the culprit.
> > 
> > However, we're soon to add a new test for the -isystem option, and then
> > when a failure occurs, we would not know whether it was because of -I or
> > -isystem. Being able to differentiate both can be hugely useful to
> > track down the root cause for the unsafe path.
> > 
> > Add two new arguments to the check_unsafe_path() function: one with the
> > current-or-previous argument, one to specify whether it has the path in
> > it or not. Print that in the error message, instead of just the path.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> Seems like a good feature addition.
> 
> > -static void check_unsafe_path(const char *path, int paranoid)
> > +static void check_unsafe_path(const char *arg,
> > +			      const char *path,
> > +			      int paranoid,
> > +			      int arg_has_path)
> >  {
> > +	va_list ap;
> > +	int once;
> 
> Those variables are not needed I believe.

Dang. Stray variables from v1... Removed now!

> >  	char **c;
> >  	static char *unsafe_paths[] = {
> >  		"/lib", "/usr/include", "/usr/lib", "/usr/local/include", "/usr/local/lib", NULL,
> > @@ -89,9 +94,15 @@ static void check_unsafe_path(const char *path, int paranoid)
> >  
> >  	for (c = unsafe_paths; *c != NULL; c++) {
> >  		if (!strncmp(path, *c, strlen(*c))) {
> > -			fprintf(stderr, "%s: %s: unsafe header/library path used in cross-compilation: '%s'\n",
> > +			fprintf(stderr,
> > +				"%s: %s: "
> > +				"unsafe header/library path used in cross-compilation:"
> > +				" '%s%s%s'\n",
> 
> I'm not a big fan of splitting the format string.

Me neither, but the line was really overly long...

(And that's why I don;t like TABs and settign them to 8; 4 spaces ought
to be enough for everyone...)

> What about inverting
> the if() test in order to reduce the indentation level of the error
> case?

Done.

> 	for (c = unsafe_paths; *c != NULL; c++) {
> 		if (strncmp(path, *c, strlen(*c)))
> 			continue;
> 		fprintf(stderr,
> 			"%s: %s: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
> 			....
> 	}
> 			
> >  				program_invocation_short_name,
> > -				paranoid ? "ERROR" : "WARNING", path);
> > +				paranoid ? "ERROR" : "WARNING",
> > +				arg,
> > +				arg_has_path ? "" : "' '",
> > +				arg_has_path ? "" : path);
> 
> I find this arg_has_path thing a bit tricky: in some cases "arg" will
> be just the argument, in some cases it is followed by the path. But I
> couldn't find a simple and nice alternate solution, so it's probably
> good as-is.

I'll add a bit of documentation to the function, so that it's more
obvious what it is doing. Still tricky, but better explained! ;-)

I've also already added a comment about the "' '" trick, too.

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
