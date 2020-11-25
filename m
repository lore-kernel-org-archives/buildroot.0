From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 13:12:00 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CALq67GBxOe=U_25AKWG9EB8bNeUveE-SX5tNyd9BG=0gqe9uEw@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CALq67GBxOe=U_25AKWG9EB8bNeUveE-SX5tNyd9BG=0gqe9uEw@mail.gmail.com>
Message-ID: <CA+h8R2rmbBY5MjBTgFitdHcDMbmyMh-w+Uvs0rVz6xOrqF-h6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, all,

On Wed, Nov 25, 2020 at 1:07 PM Ryan Barnett <ryanbarnett3@gmail.com> wrote:
> I've tried out the new go vendoring support and I am running into an
> issue with cleaning the build directory when using this series. I've
> added a new package on your pkg-mgr branch called maddy with the
> following at package/maddy/maddy.mk:

> make maddy
> make clean

> The error I get is as follows:
>
> rm -rf /home/ryan/projects/br/br-pkg-mgr/output/target
> /home/ryan/projects/br/br-pkg-mgr/output/images
> /home/ryan/projects/br/br-pkg-mgr/output/host  \
>         /home/ryan/projects/br/br-pkg-mgr/output/build
> /home/ryan/projects/br/br-pkg-mgr/output/staging \
>         /home/ryan/projects/br/br-pkg-mgr/output/legal-info
> /home/ryan/projects/br/br-pkg-mgr/output/graphs
> /home/ryan/projects/br/br-pkg-mgr/output/per-package
> rm: cannot remove
> '/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/README.md':
> Permission denied

> There are about 1000 more lines with this error. The only way I can do
> a clean is by running:
>
> sudo rm -rf output/*
>
> Here are the permissions on one of the files:
>
> $ ls -al /home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_unsafe_test.go
> -r--r--r-- 1 ryan ryan 402 Nov 25 15:01
> /home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_unsafe_test.go

This is because the Go tool sets restrictive permissions on the
gopath/pkg/mod tree to prevent source code tools from editing the
dependencies code on the filesystem.

Relevant Go issues:

 - https://github.com/golang/go/issues/27455

myitcv says: "This is, as @mark-rushakoff pointed out, working as
intended. The integrity of pkg/mod/** is important. Hence it is not
writable."

 - https://github.com/golang/go/issues/31481

We can solve this by adding "-modcacherw" flag to the "go mod"
commands. I will test this and send some more info.

Best regards,
Christian Stewart
