From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Apr 2016 23:57:07 +0200
Subject: [Buildroot] [PATCH 05/16 v5] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <20160319154741.750d2bbd@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <443f6e993a976155675520920d86e979a5fc8880.1457718289.git.yann.morin.1998@free.fr>
 <20160319154741.750d2bbd@free-electrons.com>
Message-ID: <20160428215707.GA3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 15:47 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:49:18 +0100, Yann E. MORIN wrote:
> > Almost all packages which are saved for legal-info have their source
> > archives downloaded as part of 'make source', which makes an off-line
> > build completely possible [0].
> > 
> > However, for the pre-configured external toolchains, the source tarball
> > is different, as the main tarball is a binary package. And that source
> > tarball is only downloaded during the legal-info phase, which makes it
> > inconvenient for full off-line builds.
> > 
> > We fix that by adding a new rule, $(1)-legal-source which only
> > $(1)-all-source depends on, so that we only download it for a top-level
> > 'make source', not as part of the standard download mechanism (i.e. only
> > what is really needed to build).
> > 
> > This new rule depends, like the normal download mechanism, on a stamp
> > file, so that we do not emit a spurious hash-check message on successive
> > runs of 'make source'.
> > 
> > This way, we can do a complete [0] off-line build and are still able to
> > generate legal-info, while at the same time we do not incur any download
> > overhead during a simple build.
> 
> I am wondering what is the motivation for making "make legal-info"
> absolutely executable off-line, after a "make source".

One situation is a company that has a build farm wihch does not have
acces to the internet, except for one machine that is only used to run
"make source" to populate a mirror (either a "primary mirror" or an
NFS-mounted directory) of the archives, that the other machines have
acces to and can then tap into.

In this case, the machines running "make legal-info" do not have acces
to the internet, so we need to have "make source" be complete, so it has
to also download the actual sources. This is an off-line legal-info.

Regards,
Yann E. MORIN.

> I was about to
> apply this patch, so my opinion is definitely not firm on this, but
> I have some concern:
> 
>  * Now "make source" is downloading more stuff than is actually needed
>    to do the build. And potentially a *lot* more this is going to
>    download the source code for the toolchain, which you absolutely
>    don't care about. So for a CodeSoucery ARM toolchain, instead of
>    download just the 97 MB of the toolchain, you would download 97 MB +
>    278 MB of source code. You're basically quadrupling the data to be
>    downloaded for the toolchain itself.
> 
>  * Now, after a successful build, "make source" will no longer be a
>    no-op operation, because "make source" will also download the files
>    needed for legal-info. This is IMO rather unexpected.
> 
> Now whether those two concerns are really sufficient to justify a
> different implementation can be discussed. One possible solution is to
> have a "make legal-info-source", which would download whatever
> legal-info needs to be executed offline.
> 
> That being said, we're really talking about a few corner cases, because
> essentially, only the external toolchains currently make use of
> <pkg>_ACTUAL_SOURCE.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
