From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 23 Sep 2019 09:19:02 -0300
Subject: [Buildroot] [PATCH] toolchain: generate check-headers program
 under $(BUILD_DIR)
In-Reply-To: <18546_1569240317_5D88B4FD_18546_367_2_20190923120448.GC3174@r-lnx-nyma7486-2>
References: <20190923010514.16269-1-unixmania@gmail.com>
 <6515_1569227955_5D8884B3_6515_6_12_20190923083847.GB3174@r-lnx-nyma7486-2>
 <CAJ4jsadbeyaFRcSYUWsBvTqAOCHQEhipQ8R4V31Hp8F29QdFVQ@mail.gmail.com>
 <18546_1569240317_5D88B4FD_18546_367_2_20190923120448.GC3174@r-lnx-nyma7486-2>
Message-ID: <CAJ4jsacy0eBox5B4K_DNqM5gyjD8JzKbiuu=wpdojPhiEoqRJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 23, 2019 at 9:05 AM <yann.morin@orange.com> wrote:
>
> Carlos, All,
>
> On 2019-09-23 08:17 -0300, Carlos Santos spake thusly:
> > On Mon, Sep 23, 2019 at 5:39 AM <yann.morin@orange.com> wrote:
> > > On 2019-09-22 22:05 -0300, unixmania at gmail.com spake thusly:
> > > > From: Carlos Santos <unixmania@gmail.com>
> > > >
> > > > Some installations mount /tmp with the 'noexec' option, which prevents
> > > > running the program generated there to check the kernel headers.
> > >
> > > I'm rather surprised that check-headers is the nly thing broken in that
> > > case... :-/
> > >
> > > Alternatively, we should probably use our own TMPDIR instead, which
> > > would fix all such problems:
> > >
> > >     diff --git a/Makefile b/Makefile
> > >     index 82c844620a..a006149898 100644
> > >     --- a/Makefile
> > >     +++ b/Makefile
> > >     @@ -209,6 +209,11 @@ BASE_TARGET_DIR := $(BASE_DIR)/target
> > >      HOST_DIR := $(BASE_DIR)/host
> > >      GRAPHS_DIR := $(BASE_DIR)/graphs
> > >
> > >     +export TMPDIR = $(BUILD_DIR)/.br-temp-or-whatever
> > >     +export TMP_DIR = $(TMPDIR)
> > >     +export TEMP_DIR = $(TMPDIR)
> > >     +# And so on...
> >
> > That would create all temporary files under
> > $(BUILD_DIR)/.br-temp-or-whatever, ruining the advantage of using a
> > tmpfs mounted at /tmp, which is much faster because it's in RAM.
>
> I don't know what distro mounts /tmp as a tmpfs by default. It is
> certainly not the case on my Ubuntu, or on Debian when I last installed
> one...
>
> But yes, having all temp files in $(BUILD_DIR)/.br-temp-or-whatever
> would be the expected behaviour.
>
> What I'm afraid of, is that there are (a lot of) packages that do a
> similar thing, and we would have to fix each of those individually.
> Setting a global TMPDIR would fix it once and for all.
>
> Also, I tend to see a lot of left-over temp files in /tmp, even after a
> build is completed, because pacakges buildsystems often forget to
> cleanup properly behind them, which would eventually fill /tmp on a
> long-running machine like a build server. Having our own temp dir would
> mean it actually gets cleaned when the build dir is removed.
>
> And anyway, for short-lived temp files, the 'slowness' is probably a
> false reason: the short-lived temp files will probably never actually
> hit the HDD (or SSD), and will only ever live in the kernel cache. And
> if they happen to be a bit longer-lived that they do hit torage, then
> they'd also probably undergo a round of IO scheduling, which will most
> probably postpone the actual write to long after the file is actually
> closed.
>
> But I would very like to have actual numbers to prove either way.
>
> (Doing the whole build under tmpfs is another topic, and that would
> probably provide an actual, measurable gain.)
>
> There is a third alternative. Stash the following somewhere early in the
> build process (e.g. in check-dependencies or some such):
>
>     if ! is_mounted_with_exec "${TMPDIR:-/tmp}"; then
>         printf '%s is mounted with noexec; this is not gonna fly.\n' "${TMPDIR:-/tmp}"
>         exit 1
>     fi
>
> > > 1. A trap on EXIT is a bashism, while this script uses /bin/sh, which
> > > is not guaranteed to be bash.
> >
> > From the IEEE Std 1003.1, 2004 Edition
> > (https://pubs.opengroup.org/onlinepubs/009695399/utilities/trap.html):
> >
> > "The condition can be EXIT, 0 (equivalent to EXIT), or a signal
> > specified using a symbolic name, without the SIG prefix [...]"
>
> Ah, right. It's ERR that is a bashism, my bad.
>
> > > 2. Why do you want to use a trap on EXIT? If there is a motivation to do
> > > so, it does not seem to be related to this change anyway, so should be
> > > done in its own patch.
> >
> > It's a cleaner solution.
>
> How is it cleaner? I would even argue that it is no longer obvious that
> some code is actually run at the end...
>
> The only case where I think a trap is interesting, IMHO, is when we
> want to catch errors. But as this script is not 'set -e', it will
> always go through to the end, and thus all commands in the script will
> be executed.
>
> But for a simple script like that, I fail to see the added value of a
> trap on EXIT...
>
> And even though, we would want to have that in a separate patch, because
> it is unrelated to what the patch is initially trying to fix.
>
> Regards,
> Yann E. MORIN.
>
> --
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> | +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> |      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
> '--------------------------------------:______/_____:------------------'
>
>
> _________________________________________________________________________________________________________________________
>
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
>

Sorry, I prefer to spend my time doing things instead of arguing about
them. Go ahead and do it as you want.

-- 
Carlos Santos <unixmania@gmail.com>
