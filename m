From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 27 Sep 2017 17:10:02 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] coreutils: use single binary in symlink
 method, with merged usr
In-Reply-To: <20170927211210.11b92316@windsurf.lan>
References: <1506529411-26172-1-git-send-email-casantos@datacom.ind.br>
 <1506536724-10603-1-git-send-email-casantos@datacom.ind.br>
 <20170927211210.11b92316@windsurf.lan>
Message-ID: <887476576.11301362.1506543002226.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, September 27, 2017 4:12:10 PM
> Subject: Re: [Buildroot] [PATCH v2] coreutils: use single binary in symlink method, with merged usr

> Hello,
> 
> On Wed, 27 Sep 2017 15:25:24 -0300, Carlos Santos wrote:
>> The symlink method is faster, since there is no shell fork/exec, and
>> provides extra space savings. Keep using the shebang method without
>> merged usr, because it makes easier to move binaries into other
>> directories.
> 
> I'm not sure why we would want to make a difference between merged /usr
> and non-merged /usr. Is the shebang method really useful/interesting?
> Busybox is using symlinks, and that is just fine. Why not do the same
> for coreutils?

It is useful just because some binaries need to be moved after the
installation (see commit 03f87430e54d11912e707cad105fc4f2a2590aba message)

> In addition, having too many differences between merged /usr and
> non-merged /usr is a test/maintenance burden.

Yeah, I'd rater declare merged usr as the standard and stop worrying
about this. BusyBox, coreutils, util-linux, sysvinit and procps-ng
(just to name a few), competing for the ownership of the same utilities.

Even worst, they install those utilities in different places, so we
may end-up with two different implementations of link, mktemp, nice
printenv, free, top, uptime, w, killall5, getopt, linux32, linux64,
setarch, setpriv and fsfreeze (and I'm suspicious that this list is
not complete).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
