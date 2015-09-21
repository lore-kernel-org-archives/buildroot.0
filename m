From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Sep 2015 18:57:43 +0200
Subject: [Buildroot] [PATCH] support/misc: Adding Vagrant file for
 provisioning
In-Reply-To: <CA+TH9Vkxyf6=vM1gx3BdKs_57b7cnrJwsN4NQRJ6S9tjRx+KVw@mail.gmail.com>
References: <1442471204-8305-1-git-send-email-angelo.compagnucci@gmail.com>
 <55FF2288.3010403@mind.be>
 <CA+TH9Vkxyf6=vM1gx3BdKs_57b7cnrJwsN4NQRJ6S9tjRx+KVw@mail.gmail.com>
Message-ID: <56003707.4030409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-09-15 08:19, Angelo Compagnucci wrote:
> Dear Arnout Vandecappelle,
> 
> 
> 2015-09-20 23:18 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 17-09-15 08:26, Angelo Compagnucci wrote:
>>> This patch adds a Vagrant file to buildroot. With this file
>>> you can provision a complete buildroot developing environment
>>> in minutes on all major platforms (Linux/Mac/Windows).
>>>
>>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> [snip]
>>> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
>>> new file mode 100644
>>> index 0000000..2d9151b
>>> --- /dev/null
>>> +++ b/support/misc/Vagrantfile
>>> @@ -0,0 +1,51 @@
>>> +################################################################################
>>> +#
>>> +# Vagrantfile
>>> +#
>>> +################################################################################
>>> +
>>> +### Change here for more memory/cores ###
>>> +VM_MEMORY=1024
>>> +VM_CORES=1
>>
>>  Do we need to do that? And if we do, shouldn't it be higher? 1GB will not allow
>> you to build v8 and all its derivatives (webkit, webengine).
> 
> Nope. Raising this numbers means freezing the machine of a user with a
> low end laptop.

 Fair enough.

> Probably we could add some notes on the documentation,
> but Vagrant has it's own documentation and this is the standard de
> facto way to set memory/cores of a vagrant VM. This file should be a
> starting point for people wanting to try buildroot and not a one shop
> stop for all their problems.
> 
>>> +
>>> +Vagrant.configure('2') do |config|
>>> +     config.vm.box = 'ubuntu/trusty64'
>>
>>  Is there a way to make it match the host, i.e. run a 32-bit system on a 32-bit
>> host?
> 
> Honestly I don't think there are 32bit cpus which could run Buildroot
> compilation inside a VM. For me no problem here, all the cpus with
> virt instructions are 64bits and therefore could run a 64bit host.

 It's not for 32-bit CPUs, it's for 64-bit hardware running 32-bit OS.

 Though of course you're right, the VM can still run a 64-bit OS.

> 
>>> +     config.vm.provider :vmware_fusion do |v, override|
>>> +             v.vmx['memsize'] = VM_MEMORY
>>> +             v.vmx['numvcpus'] = VM_CORES
>>> +     end
>>> +
>>> +     config.vm.provider :virtualbox do |v, override|
>>> +             v.customize ['modifyvm', :id, '--memory', VM_MEMORY]
>>> +             v.customize ['modifyvm', :id, '--cpus', VM_CORES]
>>> +     end
>>> +
>>> +     config.vm.provision 'shell' do |s|
>>> +             s.inline = 'echo Setting up machine name'
>>> +
>>> +             require 'open-uri'
>>> +             open('http://git.buildroot.net/buildroot/plain/CHANGES') do |f|
>>> +                     $buildroot_version=f.read.lines.first.split(',')[0]
>>
>>  That's not at all reliable, this version will for instance change to an rc just
>> before a release. And for instance the 2015.08.1 is not in master's CHANGES.
>>
>>  I think it's better if we add a buildroot-latest.tar.bz2 symlink to the
>> downloads directory, then we can just use that.
> 
> Of course! I falled back to this method cause I cannot find find a
> more reliable one.
> 
>>  Failing that, it's better to scrape it from http://buildroot.org/download.html
> 
> It's really strange that there is not an easy way to get the builroot
> version string easily.

 Well, the easy way would be

sed -n '/^export BR2_VERSION := /s///p' Makefile

but it's just a bad idea to take the latest git version as a basis of finding
the 'current' version of buildroot.

 You could also take the latest tag:

git tag -l | grep '^20[0-9][0-9]\.[0-9][0-9]\.[0-9.]*' | sort -n | tail -1

 But overall, I think scraping from the website makes the most sense. Or even
better would be if the current version was recorded somewhere in a file that is
used with SSI in downloads.html

> 
>>> +             end
>>> +
>>> +             config.vm.provider :vmware_fusion do |v, override|
>>> +                     v.vmx['displayname'] = "Buildroot #{$buildroot_version}"
>>> +             end
>>> +
>>> +             config.vm.provider :virtualbox do |v, override|
>>> +                     v.customize ['modifyvm', :id, '--name', "Buildroot #{$buildroot_version}"]
>>> +             end
>>> +     end
>>> +
>>> +     config.vm.provision 'shell', inline:
>>> +             "sudo apt-get -q update
>>> +             sudo apt-get -q -y install build-essential libncurses5-dev \
>>> +                     git bzr cvs mercurial subversion
>>
>>  I would also include libqt4-dev for xconfig,
> 
> Why? On windows there is not an X server to run the ssh x forwarding
> and the dependencies are really big ones. Nobody stops you to install
> them manually, it's an Ubuntu after all!
> 
>> and the dependencies for the
>> manual and for the graphs: asciidoc, w3m, dblatex, graphviz, python,
>> python-matplotlib.
> 
> Do you think we should force users to download a complete tex
> distribution only for compiling docs? As stated before users could
> install themselves if needed.
> 
> I prefer having a vagrant up setup time as small as possible to be
> operative as soon as possible!

 Okay.

 One more thing I would add though: the 32-bit compatibility libraries needed
for Sourcery toolchains. It's not that heavy and a bit tricky to find the right
ones.


 Regards,
 Arnout

> 
>> And rsync, is that included by default?
> 
> Yes, it's included in Ubuntu.
> 
> Sincerely, Angelo.
> 
>>
>>
>>  Regards,
>>  Arnout
>>
>>> +             sudo apt-get -q -y autoremove"
>>> +
>>> +     config.vm.provision 'shell', privileged: false, inline:
>>> +             "echo 'Downloading and extracting buildroot #{$buildroot_version}'
>>> +             wget -q -c http://buildroot.org/downloads/buildroot-#{$buildroot_version}.tar.gz
>>> +             tar axf buildroot-#{$buildroot_version}.tar.gz"
>>> +end
>>>
>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
