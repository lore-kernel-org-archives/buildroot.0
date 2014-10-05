From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Oct 2014 09:34:07 +0200
Subject: [Buildroot] [PATCH 12 of 15] pkg-generic: add checks on
 deprecated variables FOO_BAR_OPT
In-Reply-To: <20141004221525.GA22416@free.fr>
References: <patchbomb.1411846357@localhost>
 <27f6b6064904e682eccc.1411846369@localhost>
 <20141004191415.4db579ee@free-electrons.com> <20141004221525.GA22416@free.fr>
Message-ID: <CAAXf6LUSXJ3=tDbxM4cHqdK7Lp3wC325n4g_=Cee=T8QN4kMeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

On Sun, Oct 5, 2014 at 12:15 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas?, All,
>
> On 2014-10-04 19:14 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 27 Sep 2014 21:32:49 +0200, Thomas De Schampheleire wrote:
>>
>> > +# Ensure unified variable name conventions between all packages
>> > +$(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
>>
>> I think the legacy variable checking should go to the respective
>> package infrastructure they belong to: AUTORECONF_OPT and
>> GETTEXTIZE_OPT should go to pkg-autotools.mk, KCONFIG_OPT to
>> pkg-kconfig.mk, etc.
>>
>> The pkg-generic.mk infrastructure doesn't know anything about those
>> variables, so there's no reason to have those checks at this level.
>
> I agree on principle.
>
> However, having all of them right here avoids duplication. For example:
>   - $(2)_BUILD_OPT was valid for lua, perl and python packages,
>   - $(2)_CONF_OPT was valid for autotools, cmake and perl packages,
>   - ...
>
> Would you find appropriate that the checks be duplicated in all of the
> impacted infras?
>
> Note: I don't mind either way, just inquiring.
>
>> Care to cook a followup patch fixing that?
>
> I can have a spin at it tomorrow, unless Thomas DS is not completely fed
> up with this series! ;-)

For such small changes I make an exception :)

I more or less feel the same as Yann: for some variables we can indeed
move, but for others I'm not sure.
Here is the list:

>> > +$(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))

Such variables are used by several infras, like autotools and cmake.
So moving them to one in particular is odd. Duplicating them would be
equally undesirable.
So in this case pkg-generic.mk seems the better place to me.

Moreover, even if only one specialized infra would use such a
variable, generic packages sometimes use the same common names like
FOO_MAKE_OPTS for variables, even though their name is really
arbitrary.

>> > +$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
>> > +$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))

This can be moved to pkg-autotools.mk, it makes more sense there.

>> > +$(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))

This variable serves basically the same function as FOO_MAKE_OPTS, but
I guess it's not called '_MAKE_' because these infras (perl, python,
...) do not pass them to make.
Since they are re-used in several ones I tend to place them in pkg-generic too.

>> > +$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))

This can be moved to package/pkg-kconfig indeed.

Best regards,
Thomas
