From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 01 Sep 2012 13:24:40 +0200
Subject: [Buildroot] boost 1.51.0 bz2 archive observations
In-Reply-To: <CAJkQPO=_T94Y854wErurMiwrQyZFbW7Mt9+9ak0xGDU0ahiEaw@mail.gmail.com>
References: <CAJkQPO=_T94Y854wErurMiwrQyZFbW7Mt9+9ak0xGDU0ahiEaw@mail.gmail.com>
Message-ID: <5041F078.2080106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/31/12 17:39, Aras Vaichas wrote:
> Sorry for the cross-posting, but I'm not sure where to put this.
>
> There is a slight difference between the 1.51.0 and 1.50.0 boost bz2 files.
>
> e.g.
> \boost_1_50_0.tar.bz2\boost_1_50_0.tar\boost_1_50_0\
> \boost_1_51_0.tar.bz2\boost_1_51_0.tar\.\boost_1_51_0\
>
> I went looking for this because I updated the Boost version to 1.51.0
> in Buildroot and it failed to find the bootstrap.sh file because it
> wasn't in the expected directory.

  This happens because buildroot uses the --strip-components=1 option of
tar to remove the leading path component - and now this is just the '.' that
is removed.

  If the boost maintainers could repackage the tar file without the leading .,
that would be really nice for us.  If not, we have to construct a workaround
in buildroot to treat the boost extraction specially. (Aras: you can probably
just add "/boost_1_51_0" to all the references to $(@D) in the .mk file.)

>
> e.g.
> /opt/br/output/build$ find -name "bootstrap.sh"
> ./boost-1.51.0/boost_1_51_0/tools/build/v2/bootstrap.sh
> ./boost-1.51.0/boost_1_51_0/bootstrap.sh
> ./boost-1.50.0/tools/build/v2/bootstrap.sh
> ./boost-1.50.0/bootstrap.sh
>
> Buildroot fails to find the boostrap.sh file and the build fails.
>
> When I tried to untar it manually I got an error.
>
> $ tar xjf boost_1_51_0.tar.bz2
> tar: .: Cannot utime: Operation not permitted
> tar: .: Cannot change mode to rwxr-xr-t: Operation not permitted
> tar: Exiting with failure status due to previous errors

  This you can ignore: you're extracting in /tmp which isn't owned by
you, so you can't change the metadata of /tmp.  All files are still
untarred, it's just the exit code that's not 0.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
