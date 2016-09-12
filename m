From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 12 Sep 2016 18:22:41 -0400
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
	4.12.0.1
In-Reply-To: <b35ba70e-9552-577c-0bea-4a50e6b5fe4a@mind.be>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <b35ba70e-9552-577c-0bea-4a50e6b5fe4a@mind.be>
Message-ID: <CALe+oY-xM=Jqk17OH199Ow6wGcF193M3iKgbuYs6s7CPyKAFBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Sep 12, 2016 at 5:33 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  It's weird that you get this patch from Thomas while he isn't mentioned in the
> commit message. I thought it was because we had rpm4 before, but it turns out
> our initial commit for rpm was already rpm5. So it would be interesting to
> mention in the commit message where this comes from.

I can reference the old request where Thomas provided these patches. [1]

>
>  More importantly, however: you should add your own Sob.

Good to know, thanks!

>  Oh, and there's an active upstream at
> https://github.com/rpm-software-management/rpm
> Could you submit it there (if still relevant)?

I'll investigate this. I won't be able to try this until next month or
so, so I hope having these patches for now will suffice/causes no
complaints.

>> +     depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
>
>  Could you mention in the commit message what fails on musl? Makes fixing it
> later easier.

I tried to put that information in the actual package portion:

    depends on !BR2_TOOLCHAIN_USES_MUSL # __fxstat64, _D_EXACT_NAMELEN

Does that suffice? Or is it better to put it in the comment section?
Or is a longer comment desire? Either way, I'll clean that up.

>>       depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
>
>  or libnss

Noted.

>> +RPM_CONF_OPTS += \
>
>  Why += ?

A mistake, will fix.

>> +     --disable-largefile \
>
>  Why disable? Probably needs a comment in commit message or in .mk file.

Actually, I cannot recall. I'll investigate and add an appropriate
correction or comment.

>> +     --enable-python=no \
>
>  Doesn't --without-python or --disable-python work?

Most likely does; will cleanup.

>> +ifeq ($(BR2_PACKAGE_BEECRYPT),y)
>
>  Small nit: since Config.in selects beecrypt if !libnss, it makes more sense to
> make it similar here, i.e. ifeq ($(BR2_PACKAGE_LIBNSS),y).

Sure; I'll clean that up.

>> +RPM_CONF_ENV += \
>> +     ac_cv_prog_cc_c99='-std=gnu99' \
>
>  Doesn't configure detect this? Add a comment why not.

It doesn't. Doesn't excuse the fact that I didn't add a comment why;
I'll address this as well.

---

Thanks for all the comments.

[1]: https://patchwork.ozlabs.org/patch/528733/
