From: Mirza Krak <mirza.krak@northern.tech>
Date: Thu, 6 Aug 2020 12:57:10 +0200
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <20200717145139.50b3254a@windsurf.home>
References: <20200715173707.584226-1-aduskett@gmail.com>
 <20200717145139.50b3254a@windsurf.home>
Message-ID: <CADHdJwCSf-MkF4zCT7Yr-n8fq0b4N7c3Y2n7J0QgT_GzW46qPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 17, 2020 at 2:51 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 15 Jul 2020 10:37:04 -0700
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > Update the following license file hashes due to copyright year changes:
> >   - vendor/github.com/mendersoftware/mendertesting/LICENSE
> >   - vendor/github.com/davecgh/go-spew/LICENSE
> >   - vendor/github.com/stretchr/testify/LICENSE
> >
> > Add hashes for the the following new files:
> >   - vendor/github.com/minio/sha256-simd/LICENSE
> >   - vendor/gopkg.in/yaml.v2/LICENSE
> >   - vendor/github.com/klauspost/compress/LICENSE
> >   - vendor/github.com/russross/blackfriday/v2/LICENSE.txt
> >   - vendor/github.com/klauspost/pgzip/LICENSE
> >   - vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
> >   - vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> I don't know if this is exactly related to this version bump, but after
> this, I'm seeing my autobuilder fails to remove the output directory,
> with lots of:
>
> rm: cannot remove '/home/test/autobuild/run/instance-2/output-1/build/host-mender-artifact-3.4.0/_gopath/pkg/mod/github.com/klauspost/compress at v1.10.5/zip/testdata/utf8-osx.zip': Permission denied

Not sure if anyone else has followed up on this, but could not find a
response so I will try.

This is indeed intentional to the extent that this is how GO works
when you are using "go mod" (which mender-artifact now does). We are
not first ones having these problems and there are several tickets
discussing this, e.g [1]. This should be applicable to any GO package
in Buildroot that uses "go mod"

There seems to be two ways to get around this,

1. Use 'go clean -modcache' command which should remove these files
2. Use "-modcacherw" flag of "go mod" which will make these files R/W
(this is only available after GO 1.14.x [2])

I am not sure how to best incorporate this into Buildroot.

[1]. https://github.com/golang/go/issues/27161
[2]. https://github.com/golang/go/commit/8ba43eaad8263f26e16846e345389146ec234364

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
