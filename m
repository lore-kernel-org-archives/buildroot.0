From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Feb 2018 06:53:10 +0200
Subject: [Buildroot] Trouble with offline build
In-Reply-To: <CAMd7AX_bD6b4c2xhnsWPicPCETk9z3bDP4yT9k3Jpd9Op1F8tA@mail.gmail.com>
References: <CAMd7AX_bD6b4c2xhnsWPicPCETk9z3bDP4yT9k3Jpd9Op1F8tA@mail.gmail.com>
Message-ID: <20180228045310.bugxi5bb3w2djjaa@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aaron,

On Tue, Feb 27, 2018 at 06:34:53PM -0500, A wrote:
>  I'm a long-time fan, but first-time user.  I'm using buildroot-2017.11.2
> for an ARM target system.
> 
> My build system doesn't have internet access, so I need the offline build
> capabilities, which I am having trouble with.  The build system also is
> pretty old, and tends to lack modern packages.
> 
> I do a "make source" on a cygwin system that has internet and, and copy the
> whole thing over to the build system.
> 
> Then, on the build system, I do a "make", and I get undesired internet
> access attempts and an ultimate failure, which I show below.
> 
> I saw an archive post from 2007 here where the OP was told there are buggy
> packages that need to be patched in order for this to happen.  They are
> said to be buggy because "they lack a foo-source: target.  These need to be
> fixed."  (there was an attachment to the forum post, but the attachment has
> since been scrubbed).
> 
> Can someone please weigh in on whether this might be what is happening with
> lzip (below), and how I might go about fixing this?

Do you have lzip installed on your Internet connected machine?

> I'm new enough that I'm not even sure why this package is being
> downloaded.  I must have it in one of the config files, but it's not an
> obvious.

As you can see from the output below, this is a host package (host-lzip). lzip 
is needed to extract some packages. Buildroot builds this host package only 
when the host has no lzip installed. The same goes for a number of other 
dependencies. See support/dependencies/. So you can either install lzip on 
your build machine, or force the download of lzip with 'make lzip-source'

Hope this helps,
baruch

> A brute-force find/grep shows that there might be something about the
> BR2_LZCAT variable.  I've no idea what this means.  Is there an
> undocumented host dependency on lzip?  I see it's not installed on my
> system.
> 
> user at host:~/src/buildroot-2017.11.2$ make source
> >>> host-lzip 1.19 Downloading
> --2018-02-27 22:51:58--  http://download.savannah.gnu.
> org/releases/lzip/lzip-1.19.tar.gz
> Resolving download.savannah.gnu.org... 208.118.235.200
> Connecting to download.savannah.gnu.org|208.118.235.200|:80... connected.
> HTTP request sent, awaiting response... 503 Service Unavailable
> 2018-02-27 22:52:03 ERROR 503: Service Unavailable.
> 
> --2018-02-27 22:52:04--  http://sources.buildroot.net/lzip-1.19.tar.gz
> Resolving sources.buildroot.net... 104.27.166.48, 104.27.167.48,
> 2400:cb00:2048:1::681b:a730, ...
> Connecting to sources.buildroot.net|104.27.166.48|:80... connected.
> HTTP request sent, awaiting response... 503 Service Unavailable
> 2018-02-27 22:52:04 ERROR 503: Service Unavailable.
> 
> make[1]: *** [/home/user/src/buildroot-2017.11.2/output/build/host-lzip-1.19/.stamp_downloaded]
> Error 1
> make: *** [_all] Error 2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
