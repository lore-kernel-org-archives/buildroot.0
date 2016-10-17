From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 22:23:48 +0200
Subject: [Buildroot] [PATCH] support/misc/Vagrantfile: bump to ubuntu
 16.04
In-Reply-To: <1476686386-31512-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1476686386-31512-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <7a44219c-1e9b-48ef-5f44-3f44deb3cece@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 08:39, Angelo Compagnucci wrote:
> * Updating to ubuntu 16.04
> * Fixing dependencies
> * Fixing locale complaints

 Could you explain this a little?

> * Removing unused packages
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  support/misc/Vagrantfile | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
> index cf269fe..01262b7 100644
> --- a/support/misc/Vagrantfile
> +++ b/support/misc/Vagrantfile
> @@ -12,7 +12,7 @@ VM_MEMORY=2048
>  VM_CORES=1
>  
>  Vagrant.configure('2') do |config|
> -	config.vm.box = 'ubuntu/trusty64'
> +	config.vm.box = 'bento/ubuntu-16.04'
>  
>  	config.vm.provider :vmware_fusion do |v, override|
>  		v.vmx['memsize'] = VM_MEMORY
> @@ -44,10 +44,13 @@ Vagrant.configure('2') do |config|
>  	config.vm.provision 'shell', inline:
>  		"sudo dpkg --add-architecture i386
>  		sudo apt-get -q update
> +		sudo apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine

 Yeah, die snap die :-)

> +		sudo apt-get -q -y upgrade
>  		sudo apt-get -q -y install build-essential libncurses5-dev \
> -			git bzr cvs mercurial subversion libc6:i386 unzip
> +			git bzr cvs mercurial subversion libc6:i386 unzip bc
>  		sudo apt-get -q -y autoremove
> -		sudo apt-get -q -y clean"
> +		sudo apt-get -q -y clean
> +		sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8"

 Why en_US and not C? Are there problems with accented characters somewhere?

 Note that I have no idea how people use such a box. Do they actually work
inside it, or do they do there development from outside and just ssh or whatever
to start a build?

 Regards,
 Arnout

>  
>  	config.vm.provision 'shell', privileged: false, inline:
>  		"echo 'Downloading and extracting buildroot #{RELEASE}'
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
