From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 13:21:40 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CA+h8R2rmbBY5MjBTgFitdHcDMbmyMh-w+Uvs0rVz6xOrqF-h6A@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CALq67GBxOe=U_25AKWG9EB8bNeUveE-SX5tNyd9BG=0gqe9uEw@mail.gmail.com>
 <CA+h8R2rmbBY5MjBTgFitdHcDMbmyMh-w+Uvs0rVz6xOrqF-h6A@mail.gmail.com>
Message-ID: <CA+h8R2riT4aCEGKBC=Y9i1v80ieTj9YkTCv=Ay+-njLfipiRfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, Thomas, all,

I have a modified version of the go-post-process patch with fixes here:

https://github.com/skiffos/buildroot/commit/5f31774f54402f07c1d83aa407430db5152e6de3

On Wed, Nov 25, 2020 at 1:12 PM Christian Stewart <christian@paral.in> wrote:
> On Wed, Nov 25, 2020 at 1:07 PM Ryan Barnett <ryanbarnett3@gmail.com> wrote:
> > I've tried out the new go vendoring support and I am running into an
> > issue with cleaning the build directory when using this series. I've
> > added a new package on your pkg-mgr branch called maddy with the
> > following at package/maddy/maddy.mk:
>
> > make maddy
> > make clean
>
> > The error I get is as follows:
> >
> > rm -rf /home/ryan/projects/br/br-pkg-mgr/output/target
> > /home/ryan/projects/br/br-pkg-mgr/output/images
> > /home/ryan/projects/br/br-pkg-mgr/output/host  \
> >         /home/ryan/projects/br/br-pkg-mgr/output/build
> > /home/ryan/projects/br/br-pkg-mgr/output/staging \
> >         /home/ryan/projects/br/br-pkg-mgr/output/legal-info
> > /home/ryan/projects/br/br-pkg-mgr/output/graphs
> > /home/ryan/projects/br/br-pkg-mgr/output/per-package
> > rm: cannot remove
> > '/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/README.md':
> > Permission denied

Here is the fix for this issue specifically (using the modcacherw flag):

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 150445bf17..b22720add6 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -42,6 +42,7 @@ define inner-golang-package

 $(2)_BUILD_OPTS += \
  -ldflags "$$($(2)_LDFLAGS)" \
+ -modcacherw \
  -tags "$$($(2)_TAGS)" \
  -trimpath \
  -p $(PARALLEL_JOBS)
diff --git a/support/download/go-post-process b/support/download/go-post-process
index 8830ee56c1..1e5441f6e6 100755
--- a/support/download/go-post-process
+++ b/support/download/go-post-process
@@ -24,10 +24,12 @@ unpack ${base_name} ${output}

 # Do the Go vendoring
 pushd ${base_name} > /dev/null
+# modcacherw option leaves directories in the module cache at their default
+# permissions rather than making them read-only.
 if [ ! -f go.mod ] && [ -n "${gomod_init}" ]; then
-    go mod init ${gomod_init}
+    go mod init -modcacherw ${gomod_init}
 fi
-go mod vendor -v
+go mod vendor -modcacherw -v
 popd > /dev/null

 repack ${base_name} ${output}

Best regards,
Christian Stewart
