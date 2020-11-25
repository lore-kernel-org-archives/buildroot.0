From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 25 Nov 2020 15:07:00 -0600
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
Message-ID: <CALq67GBxOe=U_25AKWG9EB8bNeUveE-SX5tNyd9BG=0gqe9uEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

I've tried out the new go vendoring support and I am running into an
issue with cleaning the build directory when using this series. I've
added a new package on your pkg-mgr branch called maddy with the
following at package/maddy/maddy.mk:

MADDY_VERSION = 0.4.2
MADDY_SITE = $(call github,foxcpp,maddy,v$(MADDY_VERSION))

$(eval $(golang-package))

Then I run the following commands:

make maddy
make clean

The error I get is as follows:

rm -rf /home/ryan/projects/br/br-pkg-mgr/output/target
/home/ryan/projects/br/br-pkg-mgr/output/images
/home/ryan/projects/br/br-pkg-mgr/output/host  \
        /home/ryan/projects/br/br-pkg-mgr/output/build
/home/ryan/projects/br/br-pkg-mgr/output/staging \
        /home/ryan/projects/br/br-pkg-mgr/output/legal-info
/home/ryan/projects/br/br-pkg-mgr/output/graphs
/home/ryan/projects/br/br-pkg-mgr/output/per-package
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/README.md':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_amd64.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_amd64.s':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_test.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/go.mod':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhsum/xxhsum.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhsum/.gitignore':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_unsafe.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_other.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/LICENSE.txt':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/go.sum':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/.travis.yml':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_safe.go':
Permission denied
rm: cannot remove
'/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_unsafe_test.go':
Permission denied

There are about 1000 more lines with this error. The only way I can do
a clean is by running:

sudo rm -rf output/*

Here are the permissions on one of the files:

$ ls -al /home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_unsafe_test.go
-r--r--r-- 1 ryan ryan 402 Nov 25 15:01
/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/xxhash_unsafe_test.go

I've tried that same package on the latest version of master and I do
not see this error. With that same maddy.mk file on master I am able
to successfully build the package and run `make clean`. I believe the
error I see it is due to the vendoring of go modules. Before today,
I've never build a go package so I'm not familiar with how those files
could be have incorrect permissions.

Thanks,
-Ryan

On Thu, Nov 19, 2020 at 3:37 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit introduces the download post-process script
> support/download/go-post-process, and hooks it into the Go package
> infrastructure.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-golang.mk            |  7 ++++++-
>  support/download/go-post-process | 29 +++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100755 support/download/go-post-process

[...]
