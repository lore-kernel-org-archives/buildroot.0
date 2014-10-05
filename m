From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Oct 2014 09:58:01 +0200
Subject: [Buildroot] [PATCH 12 of 15] pkg-generic: add checks on
 deprecated variables FOO_BAR_OPT
In-Reply-To: <20141005095422.6a66005d@free-electrons.com>
References: <patchbomb.1411846357@localhost>
 <27f6b6064904e682eccc.1411846369@localhost>
 <20141004191415.4db579ee@free-electrons.com> <20141004221525.GA22416@free.fr>
 <CAAXf6LUSXJ3=tDbxM4cHqdK7Lp3wC325n4g_=Cee=T8QN4kMeg@mail.gmail.com>
 <20141005095422.6a66005d@free-electrons.com>
Message-ID: <CAAXf6LXK-yH-ZqPDLnnxmZ6JVHs-DGT47g66tPBFQ_GT_iYcdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 5, 2014 at 9:54 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sun, 5 Oct 2014 09:34:07 +0200, Thomas De Schampheleire wrote:
>
>> >> > +$(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
>> >> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
>> >> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
>> >> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
>> >> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
>> >> > +$(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
>>
>> Such variables are used by several infras, like autotools and cmake.
>> So moving them to one in particular is odd. Duplicating them would be
>> equally undesirable.
>> So in this case pkg-generic.mk seems the better place to me.
>
> Hum, right, I didn't realize that.
>
>> Moreover, even if only one specialized infra would use such a
>> variable, generic packages sometimes use the same common names like
>> FOO_MAKE_OPTS for variables, even though their name is really
>> arbitrary.
>
> Yes. Though it's kind of weird to "enforce" the non-usage of
> <foo>_MAKE_OPT for generic-package, since such a variable is not
> defined by the package infrastructure, and its naming left to the
> choice of the package writer. But since we indeed want to see
> <foo>_MAKE_OPTS being used instead, probably it makes sense.
>
>> >> > +$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
>> >> > +$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
>>
>> This can be moved to pkg-autotools.mk, it makes more sense there.
>>
>> >> > +$(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
>>
>> This variable serves basically the same function as FOO_MAKE_OPTS, but
>> I guess it's not called '_MAKE_' because these infras (perl, python,
>> ...) do not pass them to make.
>> Since they are re-used in several ones I tend to place them in pkg-generic too.
>>
>> >> > +$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
>>
>> This can be moved to package/pkg-kconfig indeed.
>
> Yeah, well, with this duplication thing, I'm no longer sure it's really
> worth the effort. Maybe for clarity it's better to just duplicate what
> needs to be duplicated, instead of having some variables handled in
> each individual package infra, and some others at the pkg-generic level
> even though they are specific to some package infrastructures?
>
> No strong feeling here.

I'm not sure what you mean here.
There doesn't need to be any duplication, unless you prefer to check
for, say, FOO_MAKE_OPT in several infras instead of in generic.

I did the moving around, I'll send the patches now so you can see and
we can decide the final solution.

Best regards,
Thomas
