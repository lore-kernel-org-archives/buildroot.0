From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 09:52:08 +0100
Subject: [Buildroot] [PATCH 4/5] support/docker: use a fixed Debian
 snapshot
In-Reply-To: <fc8ae732b7c23135bfc826ba28a49045c2dddd76.1517755438.git.yann.morin.1998@free.fr>
References: <cover.1517755438.git.yann.morin.1998@free.fr>
 <fc8ae732b7c23135bfc826ba28a49045c2dddd76.1517755438.git.yann.morin.1998@free.fr>
Message-ID: <2fc6c71c-c2f5-9c90-e111-de25bde185eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-02-18 15:44, Yann E. MORIN wrote:
> Since we're now using a specific base image tag, we need to also use a
> specific, stable repository to get additional packages from for this
> image.
> 
> As such, use the Debian snapshot that matches the base image.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  support/docker/Dockerfile       | 7 +++++++
>  support/docker/apt-sources.list | 4 ++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 support/docker/apt-sources.list
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index 49b74b88bd..f18d195f37 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -3,7 +3,11 @@
>  #   sudo docker build -t buildroot/base support/docker
>  #   sudo docker push buildroot/base
>  
> +# We use a specific tag for the base image *and* the corresponding date
> +# for the repository., so do not forget to update the apt-sources.list
> +# file that is shipped next to this Dockerfile.
>  FROM debian:stretch-20171210
> +
>  LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
>        vendor="Buildroot" \
>  description="Container with everything needed to run Buildroot"
> @@ -11,6 +15,9 @@ description="Container with everything needed to run Buildroot"
>  # Setup environment
>  ENV DEBIAN_FRONTEND noninteractive
>  
> +# This repository can be a bit slow at times. Don't panic...
> +COPY apt-sources.list /etc/apt/sources.list
> +
>  # The container has no package lists, so need to update first
>  RUN dpkg --add-architecture i386 && \
>      apt-get update -y && \
> diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
> new file mode 100644
> index 0000000000..789fb8fc17
> --- /dev/null
> +++ b/support/docker/apt-sources.list
> @@ -0,0 +1,4 @@
> +# Latest just before 20171210T000000Z:
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main

 AFAIU, snapshot should resolve any date to the latest available snapshot, so
http://snapshot.debian.org/archive/debian/20171210T000000Z/ should work as well
here. It should redirect to exactly the same URLs. Note thought that this
doesn't work for the top-level, only for a specific release (because they are
snapshotted at different times). So just clicking on the URL above won't work,
but if you put dists/stretch after it it redirects to
http://snapshot.debian.org/archive/debian/20171209T220346Z/dists/stretch/

 Anyway, OK for now, but something to keep in mind when it is bumped.

 Regards,
 Arnout

> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
