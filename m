From: Christian Stewart <christian@paral.in>
Date: Thu, 25 Mar 2021 22:11:51 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/nerdctl: new package
In-Reply-To: <CANQCQpabm-BFmSKGapR5Fiwu_60O-nvJtWuuVc=41h4d3ZZpbQ@mail.gmail.com>
References: <20210323051027.91385-1-christian@paral.in>
 <CANQCQpabm-BFmSKGapR5Fiwu_60O-nvJtWuuVc=41h4d3ZZpbQ@mail.gmail.com>
Message-ID: <CA+h8R2p-u8jCyhjTGH=L86AdzfbZCX7KpATPReP+2Vj_ayAFYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Tue, Mar 23, 2021 at 5:59 AM Matthew Weber <matthew.weber@collins.com> wrote:
>
> Christian,
>
> On Tue, Mar 23, 2021 at 12:11 AM Christian Stewart <christian@paral.in> wrote:
> >
> > nerdctl is a CLI for containerd (package docker-containerd) which is drop-in
> > compatible with the Docker Daemon CLI.
>
> By chance, do you have any rough estimates on the size difference
> between the set of GOLang executables between a pure Docker solution
> and a containerd+ nerdctl? (If I remember correctly Docker was
> 200-300MB (engine+CLI))

According to "graph-size":

 - docker-engine: 49MB
 - docker-cli 39MB

 - docker-containerd: 66MB

 - nerdctl: 19.3MB

So, the savings would be around ~70MB.

I believe docker-engine and docker-containerd are both much larger
than they have any right to be at the moment, and can probably be
minimized to something much smaller by deleting dependencies to
kubernetes repos, cloud provider libraries, and other features
probably most Buildroot users don't need.

One way to save space would be a "busybox" approach where there are
multiple symlinks to a single Go binary to implement both
docker-container, docker-cli, runc, etc. This way the common
dependencies (i.e. OCI interfaces) are shared between binaries
(admittedly this is what dynamic linking normally is for).

>
> I saw the other RFC as well for renaming docker-containerd to
> containerd, that makes sense to me as the containerd runtime stands
> alone and this would make any dependencies cleaner with no reference
> to docker-*.

Yeah, docker-containerd should be renamed to containerd. While it
originally was part of Docker, it's now a standalone project with
multiple downstream consumers.

Best regards,
Christian Stewart
