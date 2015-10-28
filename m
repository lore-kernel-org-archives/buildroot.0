From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 28 Oct 2015 10:07:03 -0200 (BRST)
Subject: [Buildroot] Recommended way of working on project
In-Reply-To: <CAOcYpt0a2g1t9euFaFJGwifAQen-mf8yeXP8Xh5A=RUYgPtXgA@mail.gmail.com>
References: <CAOcYpt0a2g1t9euFaFJGwifAQen-mf8yeXP8Xh5A=RUYgPtXgA@mail.gmail.com>
Message-ID: <1017452046.2914532.1446034023618.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "David Kosir" <david.kosir@bylapis.com>
> To: buildroot at buildroot.org
> Sent: Monday, October 26, 2015 7:56:34 PM
> Subject: [Buildroot] Recommended way of working on project

[...]

> I was thinking what is the best way of handling it. I've read
> recommendations here [1]

Here at DATACOM we have a rather large project with 144 local modules. Most of them are developed locally but we also have third-party code, ether proprietary or open source. We use Gerrit for source code management and review.

Our recipes download code from Gerrit. There is also a local cache of external code, pointed-out by BR2_PRIMARY_SITE. This speeds up the builds, since we don't need to access external sites (e.g. GitHub, kernel.org) to get the code.

We use custom toolchains,  according to the target platform architecture. They are installed at a fixed path (BR2_TOOLCHAIN_EXTERNAL_PATH=/opt/<foo>) to speed up build start-up.

Each module has a unit test (tier 1 test). Continuous integration is orchestrated by Jenkis. Before integration each module is submitted to static code analysis (tier 2 tests) and a quite large amount of automated functional tests (tier 3). This may sound fancy but in fact we are just playing by the book using widely known open source and commercial tools like GMock/GTest, CodeSonar and Robot Framework. Of course it requires a lot of work and duct tape.

> I see two recommended ways and third non-recommended but often approach:
> 
> 1) Use company-specific configuration and packages, don't interfere
> with buildroot files.
> 2) Use BR2_EXTERNAL and don't touch buildroot (probably use it as git
> submodule).

These options are equivalent but (2) allows us to keep our recipes in a separate repository. This is code that we can't share either because it is proprietary or because i would be useless outside so we must maintain it ourselves.

> 3) Fork buildroot and change whatever you like. Fetch new changes
> now-and-then, if possible to merge easily.

We make few changes on Buildroot but always attempt to submit them upstream. We keep a local replica on which we apply these changes on a company-local branch while their integration upstream is under work. As soon as a new Buildroot release is made available we rebase our code, removing all local additions that have been integrated.

You cam see the result of this work by looking for "@datacom.ind.br" in the master branch log:

    $ git log --oneline --author=@datacom.ind.br master

> I know that 1) and 2) are recommended but I've already stumbled upon
> problem keeps growing and repeating:
> 
> - I need to use XY package but I need newer version

We upgrade the package in our local replica and submit the update upstream.

> - I create new XY-custom package in my <company>/<board> or BR2_EXTERNAL path

We create it under $(BR2_EXTERNAL)/package and add FOO_BAR=y to

   $(BR2_EXTERNAL)/configs/$(BOAR_NAME)_defconfig

> - XY package is dependency for few other packages so I need to create
> them as *-custom package

For development we to this:

  - add a recipe under $(BR2_EXTERNAL)/package

  - add a line to $(BR2_EXTERNAL)/Config.in containing

    source "$BR2_EXTERNAL/package/foo-bar/Config.in"

  - tweak $(BR2_EXTERNAL)/configs/$(BOAR_NAME)_defconfig, adding

    FOO_BAR=y

  - add "FOO_BAR_OVERRIDE_SRCDIR = <path>" to local.mk (see documentation) for local development

After the new module is ready for integration we send it to its own Gerrit project and update the BR2_EXTERNAL project accordingly

> - I end up with 10 custom packages in two days and I expect to have 10
> more next days.

Repeat previous step 10 times. If you have different teams working on each module you will need to coordinate them but it is feasible. We did if for 154 modules (and counting).

> As my final product will basically be using all my custom packages +
> few basic buildroot packages, is there and good reason not to go with
> approach no 3) ?
> 
> I see it often online, when people just fork buildroot and continue
> working on some stable tag, rarely even bothering on merging from
> mainline as their image works and there is no need to touch it.

I'd strongly recommend you to avoid forking Buildroot. This option looks easier at first sight but becomes a nightmare in the future, when you attempt to rebase it. BR2_EXTERNAL is your friend!

> While 1) and 2) look like "right" way of doing it (as they give easy
> buildroot merging) it feels like running parallel "mini-buildroot"
> copying mainline packages and doing minor changes to them.

Do not copy/change mainline packages unless you intend to send the customizations upstream. Each new package you create is a baby that you will need to care about indefinitely. A simpler alternative is to keep custom patches under

   $(BR2_EXTERNAL)/board/all/patches/<pkg-name>[/<pkg-version>]
   $(BR2_EXTERNAL)/board/$(BOARD_NAME)/patches/<pkg-name>[/<pkg-version>]

Again, follow the documentation.

> When time comes to fetch new changes, in 1) and 2) I will need to
> looks for changes manually as I've copied old packages and in 3) I
> will have to do manual merge examining conflicts.

Keep your improvements in a local replica and submit them upstream. Rebase periodically (e.g. at each stable release).

> What are your real life project experiences, what is the best way?

If it were easy my 83 years old mommy would be doing it. Anyway, it's not rocket science; just requires strong discipline and careful planning. Endure the pain and enjoy the gain!

> Thanks
> David
> 
> [1] http://buildroot.uclibc.org/downloads/manual/manual.html#customize


Carlos Santos (Casantos)
DATACOM, P&D
