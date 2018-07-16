From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Jul 2018 21:39:58 -0300
Subject: [Buildroot] [PATCH 1/5] core: add a rule to generate all our
 docker images
References: <eb30d1e5ea7357221be1e5465e7144153b70317a.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <5b4be95e906ea_7adf3f993a093f6843712@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jul 13, 2018 at 03:38 AM, Yann E. MORIN wrote:

[snip]
> @@ -1071,6 +1071,8 @@ help:
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
>  	@echo '  printvars              - dump all the internal variables'
> +	@echo '  docker4buildroot       - build docker images of some distros, with all the'
> +	@echo '                           packages needed to use Buildroot already installed'

From your cover letter:
"Note 1: when this series is applied (if it is), I'll generate the images
and push them to the Buildroot repo on the Docker hub."

So for the everyday use, people will not build the images, but instead just
download the images and use them, something like this:
$ docker pull buildroot/fedora-28:20180717.1955

So we could use a bash script instead of creating another make target just for
this:
support/docker/build
This script could:
 - enforce it is called from base dir (if that matters, I am not sure);
 - accept the BR2_DOCKER_VERSION as a command line parameter and also in its 
   usage do state it is preferable to use the YYYYMMDD.HHMM format, reusing the
   text from the dockerfile header: "(YYYYMMDD.HHMM is the current date and
   time in UTC)"
 - allow users to easily change the prefix for the tag. It would be useful when
   someone wants to create a patch adding stuff to the docker images, generate
   a test image, upload to its own hub.docker.com account (e.g.
   docker push ricardomartincoski/debian-stretch:20180717.1955) and use it for
   tests in its own gitlab account.

[snip]
> +docker4buildroot:
> +	@if [ -z "$(BR2_DOCKER_VERSION)" ]; then \
> +		printf "Please, set the version of the docker images with BR2_DOCKER_VERSION\n"; \
> +		exit 1; \
> +	fi
> +	for d in support/docker/Dockerfile.*; do \
> +		docker build -t "buildroot/$${d#*/Dockerfile.}:$(BR2_DOCKER_VERSION)" \

After applying only patch 1 I get:
$ export BR2_DOCKER_VERSION=20180717.1955
$ make docker4buildroot
invalid argument "buildroot/*:20180717.1955" for "-t, --tag" flag: invalid reference format

Because the pattern Dockerfile.* does not match before patch 2 is applied.

You could adjust the pattern (Dockerfile.* -> Dockerfile*) but maybe even better
is to invert the order of patches 1 and 2 in the series.

> +			     -f "$${d}" "$${d%/*}" || exit 1; \
> +	done
> +


Regards,
Ricardo
