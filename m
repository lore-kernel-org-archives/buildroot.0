From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 3 Sep 2013 14:13:50 +0200
Subject: [Buildroot] [PATCH 1 of 9 v4] Config.in.legacy: update
 description for developers
In-Reply-To: <20130902225429.1f310dfd@skate>
References: <patchbomb.1378152469@argentina>
 <da9c19eca655653a9e82.1378152470@argentina>
 <20130902225429.1f310dfd@skate>
Message-ID: <CAAXf6LXKepkhjNFxYbHmvKMbjgGM0vVufky-9pVUz3-7Uc-T_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Mon, Sep 2, 2013 at 10:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 02 Sep 2013 22:07:50 +0200, Thomas De Schampheleire wrote:
>
>> The existing comments in Config.in.legacy are not entirely in-line with
>> current practice. The comments implies that BR2_LEGACY should not be set when
>> the conversion from old-to-new symbol can be done automatically using the
>> appropriate 'select' statements. However, none of the existing legacy options
>> does it this way. Moreover, I think it's intentional that the user is notified
>> of the change, so that the removal of the legacy options in later buildroot
>> versions no longer poses a problem.
>
> Does what we are doing today really makes sense? For example, option
> BR2_PACKAGE_FOO_BAR is renamed to BR2_PACKAGE_FOO_BARBLEH.
> BR2_PACKAGE_FOO_BAR is added to Config.in.legacy, with a message like
> "Option bar for package foo has been renamed barbleh". So the user goes
> into the sub-options of package "foo"... and discovers that barbleh is
> already enabled. So he kind of wonders what sort of drug Buildroot
> developers are taking, no?

:-D

>
> When there is a direct 1:1 mapping between the old option and the new
> option, is it really necessary to select BR2_LEGACY ?
>
> Shouldn't be select BR2_LEGACY only when there is really a change in
> behavior (like a package has been entirely removed, or a feature like
> toolchain on target has been removed) ?

I think there are only a few options:

1. Don't ever rename or remove symbols (so no legacy problems ever). I
don't think this is feasible/desirable.

2. Allow symbols to be renamed/removed if there is a good reason for
it, but only mention it in the README or Changelog when there is a new
release (no legacy menu). In this case, the user is completely on his
own when migrating to another buildroot release, every action is
manual. This was the situation before the legacy menu was introduced.

3. Use a legacy menu for renamed/removed symbols, indicating which
symbols are now legacy. Don't do any automatic propagation of old to
new symbols: simply warn the user and let him/her review and update
the configuration. This is the simplest to implement, there are also
no problems with weird kconfig behavior. By disabling the legacy
option, the user simply acknowledges that he has seen the legacy
messages, and the rest of the configuration remains untouched.

4. Use a legacy menu as in 3., but additionally perform automatic
propagation of old to new symbols where possible and appropriate. This
means 'select'ing the right symbols, and also introducing the
following kconfig behavior: if you disable the legacy option that
automatically selected the new symbol, the new symbol will be disabled
too if you did not save your configuration yet (see my other patch and
the resulting discussion). This is what is done at the moment, and
this is the same path my patch series was continuing on.

5. Use a legacy menu only for symbols that cannot be automatically
propagated. For all other legacy symbols, do the automatic propagation
but do not inform the user. Here you will still have an old symbol
'select'ing the new one, and the old symbol should remain hidden (I
think, to not confuse the user). I haven't tried this yet, but in my
understanding the old symbol will remain selected, and will also be
part of the defconfig. This would be confusing.
Since in this case there is no communication to the user, I think
there can be a problem with migration of defconfigs. Consider the
following: a user starts with buildroot version A, saves his project's
defconfig. Then he migrates to version B, in which some symbols have
been marked as legacy, but automatically propagated. The user does not
see a reason to update his defconfig as everything still works and he
doesn't know better. Then, he migrates to buildroot version C, where
the legacy symbols have suddenly been removed. Since his defconfig was
not changed, there is no reference to the new alternatives of the
legacy symbols, and his configuration is suddenly dysfunctional. I
think this is not very nice.
If the user would have been warned between the A->B transition, he
would have realized he needed to save a new defconfig, and the
transition from B->C would be successful.


As it stands, I'm leaning towards 3 or 4, but am open for discussion.

Best regards,
Thomas
