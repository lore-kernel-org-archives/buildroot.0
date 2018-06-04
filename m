From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Mon, 4 Jun 2018 14:22:49 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <CAESO2EKCoO3rZjLHnag3Ag-_WnMSgHcWbv8tnPW0z8GQ89azGA@mail.gmail.com>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604154433.GA3700@scaer>
 <CAESO2EJ7pwkrsrmarwBkpS7SswumuepmCYo01x2j0xpMmhGUCg@mail.gmail.com>
 <20180604165210.GA23325@g751.home>
 <CAESO2EKCoO3rZjLHnag3Ag-_WnMSgHcWbv8tnPW0z8GQ89azGA@mail.gmail.com>
Message-ID: <963979267.1048960.1528132969041.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All, 

> De: "Bob Beckett" <bbeckett@netvu.org.uk>
> Para: "Gary Bisson" <gary.bisson@boundarydevices.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Thomas Petazzoni"
> <thomas.petazzoni@bootlin.com>, "buildroot" <buildroot@buildroot.org>
> Enviadas: Segunda-feira, 4 de junho de 2018 13:54:30
> Assunto: Re: [Buildroot] [PATCH 1/2] git: fix handling of git repos using master
> as version

> On Mon, Jun 4, 2018 at 5:52 PM, Gary Bisson < [
> mailto:gary.bisson at boundarydevices.com | gary.bisson at boundarydevices.com ] >
> wrote:

>> Hi Bob

>> On Mon, Jun 04, 2018 at 05:32:41PM +0100, Bob Beckett wrote:
>> > Thanks for the more in depth explanation.

>> > I agree with all of the reasons outlined for the purpose of being purely a
>> > reproducible build manager, which buildroot only ever aimed to be.

>> > However, people do use it during development, and with a reasonably large
>> > number of custom packages all in development at the same time, using the
>> > _OVERRIDE_SRCDIR method to test latest versions of multiple packages
>> > becomes very unwieldy.
>> > My solution so far has been to point the version at the branch that active
>> > development is taking place on, and removing the build directories and
>> > packages for the specific projects each time.
>> > When I am not the one doing the development on each package's source, but
>> > am developing the rootfs, this means I dont have to manually keep updating
>> > my local git repositories for each project.
>> > Once each package has hit their first release version, they do get tagged
>> > and the release branch for the project's BR2_EXTERNAL directory gets
>> > updated with those versions, and each version thereafter, but the
>> > development branch for the external directory persistently stays on the
>> > development branch head for each package.

>> > Regarding not knowing the sha before a checkout, would git ls-remote not
>> > suffice for this? e.g.

>> > $ git ls-remote git at gitlab.com:adhlinux/buildroot/buildroot.git master
>> > 407fb2fe202aaeb273e4986dc88c30596a7fe8db refs/heads/master
>> > 407fb2fe202aaeb273e4986dc88c30596a7fe8db refs/remotes/upstream/master

>> Yes 'ls-remote' is actually a good option. You could have the following
>> package version during development:
>> FOO_VERSION = $(shell git ls-remote URL branch | awk '{ print $$1 }')

>> Then it would pick up any change automatically until you finish your dev
>> and change the FOO_VERSION to a proper ID.

> Thats actually a cracking idea. I like it (and I'm not sure why I didnt think of
> it when suggesting it for detecting outdated named head versions :) )

>> > It would allow you to check for changes in sha without doing a new fetch.

>> > Oh well, not to worry. Ill keep it as a local patch, as I suspect I am
>> > treading old ground of "buildroot is not a development platform" (Ive seen
>> > this discussion come up multiple times before).

>> Yes that will most likely not be included inside BR infrastructure but that
>> should be a perfectly fine option for your custom package.

>> Regards,
>> Gary

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

We use buildroot for development AND for integration. 

For development, you take your code, download the source and use OVERRIDE_SRCDIR as Thomas described. It works just fine. 

For integration, every developer submits the working code to a Robot, that puts the SHA in the version field in the .mk file. 

No use for branches, because sometimes the HEAD of the branch is not suitable either for development or integration. 

But, just to make a point about differences when using buildroot this way: we are not too much interested in instrumenting buildroot, with those scripts that check the files, because they affect development (pkg-rebuild) and integration (overall time). 

So, to please both the project and people using it for development/integration, i think the ideal would be to have the choice of not instrumenting a build, preferably on defconfigs. 

Just to point an important (and noticeable) difference when you are developing with buildroot. 

Regards, 

-- 
Dr. Henrique Marks 
henrique.marks at datacom.ind.br 
R. Am?rica, 1000 - Eldorado do Sul - RS 
CEP: 92990-000 - Brasil 
Fone: +55 51 3933 3000 - Ramal 3466 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/8d2fa0f2/attachment.html>
