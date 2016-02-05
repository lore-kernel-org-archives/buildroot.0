From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 5 Feb 2016 09:05:44 +0100
Subject: [Buildroot] [PATCH v3] support/misc: Adding Vagrant file for
	provisioning
In-Reply-To: <8737t8xx5a.fsf@dell.be.48ers.dk>
References: <1447887095-16773-1-git-send-email-angelo.compagnucci@gmail.com>
 <8737t8xx5a.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9Vni80B2u4toCMZdBq0pj-YycNk9b1yTNULPMWMFapKfnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

2016-02-04 17:23 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
> Hi,
>
> First of all - Sorry for the slow response!

No problem here! I have patches reviewed and ready to be merged
several months older than this one! I'm feeling lucky!

By my side, thank you for accepting it, honestly I thought there was
some grudge against.

>  > This patch adds a Vagrant file to buildroot. With this file
>  > you can provision a complete buildroot developing environment
>  > in minutes on all major platforms (Linux/Mac/Windows).
>
>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
>
>  > diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
>  > index 3437f93..84e1f54 100644
>  > --- a/docs/manual/getting.txt
>  > +++ b/docs/manual/getting.txt
>  > @@ -10,6 +10,20 @@ November. Release numbers are in the format YYYY.MM, so for example
>
>  >  Release tarballs are available at http://buildroot.org/downloads/[].
>
>  > +An official https://www.vagrantup.com/[Vagrantfile] is distributed within buildroot for your needs.
>  > +If you want to setup an isolated buildroot environment on Linux or
>  > +Mac Os X, paste this line onto your terminal:
>  > +
>  > +--------------------
>  > +curl -O http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile; vagrant up
>
> Next to Yanns comments I would prefer to use wget like we do elsewhere
> in Buildroot to download stuff.

Argh! That curl was on purpose (probably I'm a novice in the buildroot
world, but not completely thoughtless!), wget it's not distributed
with Mac Os X and it's quite an accomplishment installing it [1]. I'll
send a patch soon.

> Instead of grabbing this from cgit I have instead put the file together
> with the release tarballs (https://buildroot.org/downloads).

Great news!

>> --- a/docs/website/download.html
>  > +++ b/docs/website/download.html
>  > @@ -32,6 +32,23 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
>
>  >  <p>
>
>  > +<p>
>  > +An official <a href="https://www.vagrantup.com/">Vagrantfile</a>
>  > +is distributed within buildroot for your needs.
>  > +If you want to setup an isolated buildroot environment on Linux or
>  > +Mac Os X, paste this line onto your terminal:
>  > +
>  > +<pre>
>  > +curl -O http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile; vagrant up
>  > +</pre>
>  > +
>  > +If you are on Windows, paste this into your powershell:
>  > +
>  > +<pre>
>  > +(new-object System.Net.WebClient).DownloadFile("http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile","Vagrantfile"); vagrant up
>  > +</pre>
>  > +</p>
>  > +
>
> This no longer applies and as Yann mentioned it isn't really needed so
> I've dropped this hunk.

I don't agree too much, giving hints to run buildroot on windows or
Mac Os X it's really important to grow our userbase and I think it
deserve it's own box on the download page!
I'll submit a new patch soon.

>  > diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
>  > new file mode 100644
>  > index 0000000..93a7cf8
>  > --- /dev/null
>  > +++ b/support/misc/Vagrantfile
>  > @@ -0,0 +1,59 @@
>  > +################################################################################
>  > +#
>  > +# Vagrantfile
>  > +#
>  > +################################################################################
>  > +
>  > +### Change here for more memory/cores ###
>  > +VM_MEMORY=1024
>  > +VM_CORES=1
>
> I couldn't even build our defconfig with 1G, so I've bumped it to 2GB of RAM.

Ok!

>
>> +
>  > +Vagrant.configure('2') do |config|
>  > +    config.vm.box = 'ubuntu/trusty64'
>  > +
>  > +    config.vm.provider :vmware_fusion do |v, override|
>  > +            v.vmx['memsize'] = VM_MEMORY
>  > +            v.vmx['numvcpus'] = VM_CORES
>  > +    end
>  > +
>  > +    config.vm.provider :virtualbox do |v, override|
>  > +            v.memory = VM_MEMORY
>  > +            v.cpus = VM_CORES
>  > +
>  > +            required_plugins = %w( vagrant-vbguest )
>  > +            required_plugins.each do |plugin|
>  > +              system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
>  > +            end
>  > +    end
>  > +
>  > +    config.vm.provision 'shell' do |s|
>  > +            s.inline = 'echo Setting up machine name'
>  > +
>  > +            require 'open-uri'
>  > +            open('http://buildroot.org/download.html') do |f|
>  > +                    $buildroot_version = f.read.lines.grep(/The latest stable release/)[0]
>  > +                            .split('<b>')[1].split('</b>')[0]
>
> This is not really robust (in fact it is already broken after the last
> website changes), so I've gone back to your first version and simply
> defined the BR version in a variable at the top of the file. I'll add it
> to my release steps to also update this whenever we release a new
> version.

Wow! This is exactly what I was looking for!

>> +             end
>  > +
>  > +            config.vm.provider :vmware_fusion do |v, override|
>  > +                    v.vmx['displayname'] = "Buildroot #{$buildroot_version}"
>  > +            end
>  > +
>  > +            config.vm.provider :virtualbox do |v, override|
>  > +                    v.name = "Buildroot #{$buildroot_version}"
>  > +            end
>  > +    end
>  > +
>  > +    config.vm.provision 'shell', inline:
>  > +            "sudo dpkg --add-architecture i386
>  > +            sudo apt-get -q update
>  > +            sudo apt-get -q -y install build-essential libncurses5-dev \
>  > +                    git bzr cvs mercurial subversion libc6:i386
>
> dependencies.sh also checks for unzip, so I've added that as well.

Ops, totally missed that, thank you!

> Committed with these fixes, thanks.

A big thank you!

>
> --
> Bye, Peter Korsgaard

[1] http://stackoverflow.com/questions/4572153/os-x-equivalent-of-linuxs-wget


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
