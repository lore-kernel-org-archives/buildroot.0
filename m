From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Jun 2020 21:57:23 +0200
Subject: [Buildroot] [PATCH 3/4 v2] support/docker: allow the br-user to
 becone root
In-Reply-To: <c0ad050e8feddfcabfe5711eec297a71d2923da0.1589751688.git.yann.morin.1998@free.fr>
References: <cover.1589751688.git.yann.morin.1998@free.fr>
 <c0ad050e8feddfcabfe5711eec297a71d2923da0.1589751688.git.yann.morin.1998@free.fr>
Message-ID: <73811e03-0b85-2022-6e9d-4a681a8fc308@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 17/05/2020 ? 23:41, Yann E. MORIN a ?crit?:
> When our Dockerfiles (and images) get reused by users, they might need
> to locally add new packages or tweak the iamge to heir local needs.
> 
> As such, register the br-user to become root by running (exactly!):
>     $ sudo su -
> 
> This will allow acutally becoing root without prompting for a password,
> but no other command will be accepted, and no other paramter will be
> accepted either.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc; Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  support/docker/Dockerfile.debian-stretch | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/docker/Dockerfile.debian-stretch b/support/docker/Dockerfile.debian-stretch
> index 0d2ce2aa79..7ce9f406c6 100644
> --- a/support/docker/Dockerfile.debian-stretch
> +++ b/support/docker/Dockerfile.debian-stretch
> @@ -49,6 +49,7 @@ RUN apt-get install -y --no-install-recommends \
>          qemu-system-x86 \
>          rsync \
>          subversion \
> +        sudo \
>          unzip \
>          wget \
>          && \
> @@ -60,7 +61,9 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
>      /usr/sbin/locale-gen
>  
>  RUN useradd -ms /bin/bash br-user && \
> -    chown -R br-user:br-user /home/br-user
> +    chown -R br-user:br-user /home/br-user && \
> +    printf 'br-user ALL=NOPASSWD: /bin/su -\n' >/etc/sudoers.d/br-user && \
> +    chmod 0440 /etc/sudoers.d/br-user
>  
>  USER br-user
>  WORKDIR /home/br-user
> 
