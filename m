From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Feb 2011 08:35:05 +0100
Subject: [Buildroot] [PATCH] makedevs: fix cases where (start != 0)
In-Reply-To: <87tyfvn1lm.fsf@macbook.be.48ers.dk>
References: <4D63E496.8020704@gmail.com> <87tyfvn1lm.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTim5v30bAeJ=H_TZ1N=ze6UaFh4MnsURchwQ-=_B@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Feb 22, 2011 at 11:31 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
> ?Thomas> The makedevs script did not always generate the requested set of device names / minor number series.
> ?Thomas> * If start != 0, then requesting (count) devices would generate only (count - start)
> ?Thomas> * If start != 0 && increment != 1, then requesting minors starting with (minor) would generate minors starting with (minor + (start * (increment - 1)))
>
> ?Thomas> This patch fixes the code and updates the usage text with extra examples.
>
> Good catch, thanks!

I should point out that the first problem was reported by Andy Kennedy.

>
> ?Thomas> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?full_name_inc = xmalloc(strlen(full_name) + 8);
> ?Thomas> - ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?for (i = start; i < count; i++) {
> ?Thomas> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?for (i = start; i < start + count; i++) {
> ?Thomas> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?sprintf(full_name_inc, "%s%d", full_name, i);
> ?Thomas> - ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?rdev = makedev(major, minor + (i * increment - start));
> ?Thomas> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?rdev = makedev(major, minor + ((i - start) * increment));
>
> It looks like the logic would be simplified some by using:
>
> ? for (i=0; i < count; i++) {
>
> Care to rework the patch to do that instead?

Not at all. I'll send the updated patch tonight. You're right that it
will make the logic cleaner.

>
> You could argue if it makes more sense to use start or minor in the
> makedevs call - They should be the same, but perhaps it would be cleaner
> to use the same everywhere instead of this mix.

start relates to the start of the device names
minor relates to the start of the minor numbers

The updated patch will show this distinction more clearly. The
makedevs call will only use minor then.

Note that increment only refers to the minor number, and its position
in the device table file is somewhat confusing (placed between start
and count). Currently, there is no possibility to have an increment
other than 1 for the device names, except when listing each
combination explicitly.

Best regards,
Thomas
