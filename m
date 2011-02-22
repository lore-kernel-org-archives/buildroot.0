From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Feb 2011 23:31:01 +0100
Subject: [Buildroot] [PATCH] makedevs: fix cases where (start != 0)
In-Reply-To: <4D63E496.8020704@gmail.com> (Thomas De Schampheleire's message
	of "Tue, 22 Feb 2011 17:30:14 +0100")
References: <4D63E496.8020704@gmail.com>
Message-ID: <87tyfvn1lm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The makedevs script did not always generate the requested set of device names / minor number series.
 Thomas> * If start != 0, then requesting (count) devices would generate only (count - start)
 Thomas> * If start != 0 && increment != 1, then requesting minors starting with (minor) would generate minors starting with (minor + (start * (increment - 1)))

 Thomas> This patch fixes the code and updates the usage text with extra examples.

Good catch, thanks!

 Thomas>  				full_name_inc = xmalloc(strlen(full_name) + 8);
 Thomas> -				for (i = start; i < count; i++) {
 Thomas> +				for (i = start; i < start + count; i++) {
 Thomas>  					sprintf(full_name_inc, "%s%d", full_name, i);
 Thomas> -					rdev = makedev(major, minor + (i * increment - start));
 Thomas> +					rdev = makedev(major, minor + ((i - start) * increment));

It looks like the logic would be simplified some by using:

   for (i=0; i < count; i++) {

Care to rework the patch to do that instead?

You could argue if it makes more sense to use start or minor in the
makedevs call - They should be the same, but perhaps it would be cleaner
to use the same everywhere instead of this mix.

-- 
Bye, Peter Korsgaard
