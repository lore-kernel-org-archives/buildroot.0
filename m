From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 9 Aug 2019 18:32:18 -0300
Subject: [Buildroot] [PATCH v2] package/dhcp: fix installation with
 BR2_STATIC_LIBS=y
In-Reply-To: <20190809225617.258f0e63@windsurf.home>
References: <20190809120544.12405-1-unixmania@gmail.com>
 <20190809225617.258f0e63@windsurf.home>
Message-ID: <CAJ4jsaffZCopr+reLA0540VTaBAe2ExtKSXUmUJ119ib27QxfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 9, 2019 at 5:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  9 Aug 2019 09:05:44 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Use the "install-sbinPROGRAMS" make target to install the utilities
> > instead of guessing their locations. We disable libtool for static
> > builds so the binaries are not always in a ".libs" subdir.
> >
> > Fixes:
> >   http://autobuild.buildroot.net/results/0c43c02b8d418b60b4734187abde1da585e9e0ca/
> >   http://autobuild.buildroot.net/results/e61b246df60af1e59b8f643510557ef2270f2d97/
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> >  package/dhcp/dhcp.mk | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
>
> Applied to master, thanks. It is worth mentioning that dhcp installs a
> dangling symlink:
>
> $ ls -l output/target/usr/sbin/
> total 344
> -rwxr-xr-x 1 thomas thomas 321496  9 ao?t  22:53 dhcpd
> -rwxr-xr-x 1 thomas thomas  26064  9 ao?t  22:53 dhcrelay
> lrwxrwxrwx 1 thomas thomas     12  9 ao?t  22:52 tsig-keygen -> ddns-confgen
>
> ddns-confgen is not installed, so tsig-keygen doesn't point to anything.
>
> Best regards,

Nope, that one belongs to bind, not to dhcp:

$ fgrep tsig-keygen build/packages-file-list.txt
bind,./usr/sbin/tsig-keygen
bind,./usr/share/man/man8/tsig-keygen.8

I will take a look and submit a fix.

-- 
Carlos Santos <unixmania@gmail.com>
