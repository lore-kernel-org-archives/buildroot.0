From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 10 Sep 2015 14:56:45 -0700
Subject: [Buildroot] [RFC v2] support/misc: Adding Vagrant file for
	provisioning
In-Reply-To: <1441919530-5421-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1441919530-5421-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CAHsRNLj0ogoFvjapJoCix9=7Cv4yv53VeASYG70+_CF2wXrgLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,


On Thu, Sep 10, 2015 at 2:12 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> This patch adds a Vagrant file to buildroot. With this file
> you can provision a complete buildroot developing environment
> in minutes on all major platforms.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changelog:
>
> v1->v2:
> * Autodetecting of latest buildroot version from CHANGES file.
> * Better documentation
>
>  docs/manual/getting.txt    | 14 ++++++++++++++
>  docs/website/download.html | 16 ++++++++++++++++
>  support/misc/Vagrantfile   | 47 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>  create mode 100644 support/misc/Vagrantfile
>
> diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
> index 3437f93..8b3ebb0 100644
> --- a/docs/manual/getting.txt
> +++ b/docs/manual/getting.txt
> @@ -10,6 +10,20 @@ November. Release numbers are in the format YYYY.MM, so for example
>
>  Release tarballs are available at http://buildroot.org/downloads/[].
>
> +An official Vagrantfile is distributed within buildroot for your needs.
> +If you want to setup an isolated buildroot environment on Linux or
> +Mac Os X, paste this line onto your terminal:
> +
> +--------------------
> +curl -O http://git.buildroot.net/buildroot/tree/support/misc/Vagrantfile; vagrant up
> +--------------------
> +
> +If you are on windows, paste this into your powershell:
> +
> +--------------------
> +Invoke-WebRequest http://git.buildroot.net/buildroot/tree/support/misc/Vagrantfile -OutFile Vagrantfile; vagrant up
> +--------------------
> +
>  If you want to follow development, you can use the daily snapshots or
>  make a clone of the Git repository. Refer to the
>  http://buildroot.org/download[Download page] of the Buildroot website
> diff --git a/docs/website/download.html b/docs/website/download.html
> index ef87b1c..7d3fd1b 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -32,6 +32,22 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
>
>  <p>
>
> +<p>
> +An official Vagrantfile is distributed within buildroot for your needs.
> +If you want to setup an isolated buildroot environment on Linux or
> +Mac Os X, paste this line onto your terminal:
> +
> +<pre>
> +curl -O http://git.buildroot.net/buildroot/tree/support/misc/Vagrantfile; vagrant up
> +</pre>
> +
> +If you are on windows, paste this into your powershell:
> +
> +<pre>
> +Invoke-WebRequest http://git.buildroot.net/buildroot/tree/support/misc/Vagrantfile -OutFile Vagrantfile; vagrant up
> +</pre>
> +</p>
> +
>  You can also obtain daily snapshots of the latest Buildroot source tree if you
>  want to follow development, but cannot or do not wish to use Git.
>
> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
> new file mode 100644
> index 0000000..36cb3e0
> --- /dev/null
> +++ b/support/misc/Vagrantfile
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# Vagrantfile
> +#
> +################################################################################
> +
> +### Change here for more memory/cores or different version ###
> +VM_MEMORY=1024
> +VM_CORES=1
> +
> +require 'open-uri'
> +open("http://git.buildroot.net/buildroot/plain/CHANGES") do |f|
> +  BUILDROOT_VERSION=f.read.lines.first.split(",")[0]
> +end

As it is now, CHANGES will be redownloaded every time a vagrant
command is issued. Can this be moved into $script so that it's only
executed once during provisioning? This bit could be written in shell
with something like:

    curl -s http://git.buildroot.net/buildroot/plain/CHANGES | head -1
| awk -F ',' '{print $1}'

Though, I'm not sure if there's a better way to determine the current
released Buildroot version.

> +
> +$sudo_script = <<SCRIPT
> +sudo apt-get update
> +sudo apt-get -y install build-essential libncurses5-dev \
> +  git bzr cvs mercurial subversion
> +sudo apt-get -y autoremove
> +SCRIPT

Some apt warnings can be suppressed by exporting DEBIAN_FRONTEND=noninteractive

> +
> +$script = <<SCRIPT
> +echo "Downloading buildroot #{BUILDROOT_VERSION}"
> +wget -q -c http://buildroot.org/downloads/buildroot-#{BUILDROOT_VERSION}.tar.gz
> +tar axf buildroot-#{BUILDROOT_VERSION}.tar.gz
> +SCRIPT
> +
> +Vagrant.configure("2") do |config|
> +  config.vm.box = "ubuntu/trusty64"
> +
> +  config.vm.provider :vmware_fusion do |v, override|
> +    v.vmx['displayname'] = 'Buildroot #{BUILDROOT_VERSION}'
> +    v.vmx["memsize"] = VM_MEMORY
> +    v.vmx["numvcpus"] = VM_CORES
> +  end
> +
> +  config.vm.provider :virtualbox do |v, override|
> +    v.name = "Buildroot"
> +    v.customize ["modifyvm", :id, "--name", "Buildroot #{BUILDROOT_VERSION}"]
> +    v.customize ["modifyvm", :id, "--memory", VM_MEMORY]
> +    v.customize ["modifyvm", :id, "--cpus", VM_CORES]
> +  end
> +
> +  config.vm.provision "shell", inline: $sudo_script
> +  config.vm.provision "shell", privileged: false, inline: $script
> +end
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
