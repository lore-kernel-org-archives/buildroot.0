From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Oct 2012 11:08:40 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
 <20121002194921.5fb92a46@skate>
 <CAMJ=MEf59P7U5hFc43kqNwBJg-O1narSbvjvRO5cGfueps+vcw@mail.gmail.com>
 <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
Message-ID: <506D5218.2060401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/12 22:46, Ronny Meeus wrote:
> Another solution would be to have 2 buildroot environments, 1 for the
> 32bit applications and 1 for the 64bit applications.
> For example the 64bit could be "the master" one. In this a directory
> of the slave buildroot can be specified and this master will merge the
> 32bit applications together with its libraries from the slave
> output/target into its own target/output and remake the rootfs.
>
> This might not be a nice solution, but I think it will work.
>
> It can be considered similar to BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
> where a copy is made of certain things into the root-fs.

  First of all, I'm not at all convinced that the multilib usecase is valid
for buildroot.  I mean, obviously it's a valid usecase, but if you need
that I don't think that buildroot should be your weapon of choice.

  That said, if you (temporarily) do need a mixed 32/64-bit system, I think
this approach is the most appropriate: make two separate buildroot builds,
and merge them together at the end.  The merge can be done in the post-build
script.  The post-build script could even call the'make' for the other part
  of the system...  The tricky part is that the libraries from the 'slave'
environment will have to be moved into a multilib directory (i.e. lib32 or
lib64).

  I don't immediately see a need for changes in the buildroot infrastructure.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
