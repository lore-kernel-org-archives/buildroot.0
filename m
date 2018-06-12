From: Stefan Becker <chemobejk@gmail.com>
Date: Tue, 12 Jun 2018 22:25:57 +0300
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <20180612210124.18e1f168@windsurf>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
 <20180612210124.18e1f168@windsurf>
Message-ID: <CAOJ2eMfh5-dqjRxrZhhBv6yQj6k1jgstnDSWqtsy4LG+UuVmBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

On Tue, Jun 12, 2018 at 10:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> I believe one of the reason we all like and use Buildroot is because of
> its simplicity. And simplicity is a very difficult thing to preserve:

IMHO this change is the very opposite of "preserving simplicity". It
adds unwanted things to the buildroot build. The unwanted things might
even be unusable for existing users of "sdk".

Please don't get me wrong. I'm not against the SDK tarball itself.

But I'm against building something for naught. If the tarball turns
out to be unusable I get slower buildroot builds. Which in turns will
force me to extract what "original sdk without tarball" was doing out
of buildroot makefile and hard-code it into my build script. And then
I can remove "sdk" from the buildroot make command. I fail to see how
that is simpler.

If you don't offer a way to specify the generated tarball name, fine.
Then I won't use sdk-tarball at all, even if the tarball itself would
be usable in our downstream integration. Or I could come up with a way
to "guess" the build artefact name in my build script and symlink it
to the wanted build artefact name (again, I fail to see how this is
simpler).

I don't understand why "sdk-tarball: sdk" is not an acceptable
solution. It would be much simpler.

Regards, Stefan

PS: just to be complete, this is what my current build script does
after "make all sdk" has been completed:

    (cd output/host && tar -cvJf ../host.tar.xz *)

The collected build artefact is "host.tar.xz". AFAIR that name can't
be changed dynamically without breaking the automatic downstream build
flow in Jenkins.
