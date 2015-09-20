From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Sep 2015 23:18:00 +0200
Subject: [Buildroot] [PATCH] support/misc: Adding Vagrant file for
 provisioning
In-Reply-To: <1442471204-8305-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1442471204-8305-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <55FF2288.3010403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-09-15 08:26, Angelo Compagnucci wrote:
> This patch adds a Vagrant file to buildroot. With this file
> you can provision a complete buildroot developing environment
> in minutes on all major platforms (Linux/Mac/Windows).
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[snip]
> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
> new file mode 100644
> index 0000000..2d9151b
> --- /dev/null
> +++ b/support/misc/Vagrantfile
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# Vagrantfile
> +#
> +################################################################################
> +
> +### Change here for more memory/cores ###
> +VM_MEMORY=1024
> +VM_CORES=1

 Do we need to do that? And if we do, shouldn't it be higher? 1GB will not allow
you to build v8 and all its derivatives (webkit, webengine).

> +
> +Vagrant.configure('2') do |config|
> +	config.vm.box = 'ubuntu/trusty64'

 Is there a way to make it match the host, i.e. run a 32-bit system on a 32-bit
host?

> +
> +	config.vm.provider :vmware_fusion do |v, override|
> +		v.vmx['memsize'] = VM_MEMORY
> +		v.vmx['numvcpus'] = VM_CORES
> +	end
> +
> +	config.vm.provider :virtualbox do |v, override|
> +		v.customize ['modifyvm', :id, '--memory', VM_MEMORY]
> +		v.customize ['modifyvm', :id, '--cpus', VM_CORES]
> +	end
> +
> +	config.vm.provision 'shell' do |s|
> +		s.inline = 'echo Setting up machine name'
> +
> +		require 'open-uri'
> +		open('http://git.buildroot.net/buildroot/plain/CHANGES') do |f|
> +			$buildroot_version=f.read.lines.first.split(',')[0]

 That's not at all reliable, this version will for instance change to an rc just
before a release. And for instance the 2015.08.1 is not in master's CHANGES.

 I think it's better if we add a buildroot-latest.tar.bz2 symlink to the
downloads directory, then we can just use that.

 Failing that, it's better to scrape it from http://buildroot.org/download.html

> +		end
> +
> +		config.vm.provider :vmware_fusion do |v, override|
> +			v.vmx['displayname'] = "Buildroot #{$buildroot_version}"
> +		end
> +
> +		config.vm.provider :virtualbox do |v, override|
> +			v.customize ['modifyvm', :id, '--name', "Buildroot #{$buildroot_version}"]
> +		end
> +	end
> +
> +	config.vm.provision 'shell', inline:
> +		"sudo apt-get -q update
> +		sudo apt-get -q -y install build-essential libncurses5-dev \
> +			git bzr cvs mercurial subversion

 I would also include libqt4-dev for xconfig, and the dependencies for the
manual and for the graphs: asciidoc, w3m, dblatex, graphviz, python,
python-matplotlib. And rsync, is that included by default?


 Regards,
 Arnout

> +		sudo apt-get -q -y autoremove"
> +
> +	config.vm.provision 'shell', privileged: false, inline:
> +		"echo 'Downloading and extracting buildroot #{$buildroot_version}'
> +		wget -q -c http://buildroot.org/downloads/buildroot-#{$buildroot_version}.tar.gz
> +		tar axf buildroot-#{$buildroot_version}.tar.gz"
> +end
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
