From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Tue, 19 Nov 2019 18:31:35 +0000
Subject: [Buildroot] [PATCH 1/2] package/gmpc: needs -lm
In-Reply-To: <CAPi7W83fDiF+iM4FZrPgAXvujqVXMHS66uCjs+s4=9R1F0qVhw@mail.gmail.com>
References: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
 <20191108220442.4b596996@windsurf> <20191108222841.4ff8debf@gmx.net>
 <c16fab60-ebf2-106e-962f-c2595472803d@mind.be>
 <20191117212001.6907f54a@gmx.net> <20191117214818.4d68ae6f@gmx.net>
 <df61ba8d-99d4-f16b-50ed-3e7ae28e4962@mind.be>
 <20191118234238.363e7c04@gmx.net> <20191118234722.21f79c8f@windsurf.home>
 <56bd6374-c235-1fa8-4e1f-c7137068a92b@codethink.co.uk>
 <CAPi7W83fDiF+iM4FZrPgAXvujqVXMHS66uCjs+s4=9R1F0qVhw@mail.gmail.com>
Message-ID: <292afc07-784e-e938-dc0e-d9d8d4c0e3e3@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/2019 17:58, Fabrice Fontaine wrote:
> Le mar. 19 nov. 2019 ? 17:18, Thomas Preston
> <thomas.preston@codethink.co.uk> a ?crit :
>> So I don't understand two things:
>> 1. Where did `-lm` in the .la files come from before the pkgconf patch?
>> 2. Why does upsteam gmpc build without `-lm`?
> This one is easy: we're using the latest release of gmpc that is 8 years old.
> In this release, Math.ceil is used in
> https://github.com/DaveDavenport/gmpc/blob/release-11.8.16/src/Widgets/GmpcVolume.vala.
> Upstream removed this file 6 years ago through
> https://github.com/DaveDavenport/gmpc/commit/11a7d247757dd29b51c77fda7470921fd254aae8#diff-645d920fce926ffdadd85c93c2d2cda2.
> I assume that current gmpc does not use any math functions anymore.

Ah, when I said upstream I actually meant "the gmpc-11.8.16 tar from upstream",
as opposed to building within the Buildroot environment. I should have been
more clear.

There are no `-lm` flags:

	gmpc-11.8.16$ grep -lwr "\-lm"
	ltmain.sh
	m4/libtool.m4
	libtool

But I can successfully build gmpc:

	gmpc-11.8.16$ strings src/gmpc | grep ceil
	lceil
	rceil

This is outside of buildroot.

Maybe we should focus on building the latest development version of gmpc
from github?

To be clear, I don't think the pkgconf patch has caused a regression, I
think that gmpc in buildroot is broken. Although, I'm still trying to
build a solid case for this.
