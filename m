From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Nov 2017 22:44:02 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171118222250.4f4e8e3d@gmx.net>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
 <20171118222250.4f4e8e3d@gmx.net>
Message-ID: <20171120214402.GB2867@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout, All,

On 2017-11-18 22:22 +0100, Peter Seiderer spake thusly:
> On Thu, 16 Nov 2017 14:43:48 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
[--SNIP--]
> >  Oh boy...
> > 
> >  The problem is that on Tumbleweed the order of inclusion seems to be different,
> > which causes toolchain-external-package not to be defined at the time that
> > toolchain-external-custom.mk is included (same for all other external toolchains).
> > 
> > Makefile:492:include toolchain/*/*.mk
> > 
> > This causes inclusion of
> > toolchain/toolchain-external/toolchain-external.mk:28:include
> > toolchain/toolchain-external/*/*.mk
> > and
> > toolchain/toolchain-external/pkg-toolchain-external.mk:592:toolchain-external-package
> > = ...
> > 
> >  If the *.mk is expanded in alphabetical order, pkg-toolchain-external.mk will
> > always come before toolchain-external.mk. Otherwise it is possible (depending on
> > the state of hash tables or inode numbers or whatever) that
> > toolchain-external-custom.mk gets included first.
> > 
> >  The short-term solution is of course $(sort $(wildcard ...))
> 
> Your investigation seems to be right, the following patch fixes it for me (no
> 32-bit support installed yet, but the cross compiler is extracted and I get
> the 'Cannot execute cross-compiler' error message again):
[--SNIP--]
> -include toolchain/*.mk
> -include toolchain/*/*.mk
> +include $(sort $(wildcard toolchain/*.mk))
> +include $(sort $(wildcard toolchain/*/*.mk))

I think that using $(wildcard) explicitly is Good (TM), rather than using
globs.

Also, $(sort) is Good Too (TM) because it guarantees the build order. So
far, $(sort) internally used strcmp() to compare strings [0] [1], so
works on bytes, not characters, so does not account for the locale
settings. However, that may change in the future, so we'd have to enforce
the C locale to guarantee ordering.

Can you submit this officially, please? Keep me in Cc when you do so,
thanks! ;-)

[0] https://git.savannah.gnu.org/cgit/make.git/tree/src/function.c#n1161
[1] https://git.savannah.gnu.org/cgit/make.git/tree/src/misc.c#n41

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
