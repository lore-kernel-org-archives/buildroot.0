From: Christopher Peeters <christopher@lecroq.be>
Date: Mon, 15 Apr 2019 09:46:43 +0200
Subject: [Buildroot] [PATCH 1/1] Add libvirt (KVM) support
In-Reply-To: <20190413222137.6c0cba37@windsurf>
References: <20190215173607.13773-1-christopher@lecroq.be>
 <20190413222137.6c0cba37@windsurf>
Message-ID: <da50400b-6cf2-d87a-3a51-c54a46b7cea6@lecroq.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your email. I wasn't aware about the commit title
conventions so I will fix this.

The reason why I selected a different distribution is the lack of
support for Libvirt by the original distribution. When you do `vagrant
up` with the original Vagrantfile and KVM/Libvirt as default vagrant
provider, vagrant will quit with the error that the current box can't be
found / isn't supported. Please check the snippet below for more
information. The "generic/ubuntu1804" is also a Ubuntu Bionic machine
which is well-supported so I selected this one to be able to use
Buildroot on Vagrant on Libvirt.

```

$ vagrant up
==> vagrant: A new version of Vagrant is available: 2.2.4!
==> vagrant: To upgrade visit: https://www.vagrantup.com/downloads.html

Bringing machine 'default' up with 'libvirt' provider...
==> default: Box 'ubuntu/bionic64' could not be found. Attempting to
find and install...
??? default: Box Provider: libvirt
??? default: Box Version: >= 0
==> default: Loading metadata for box 'ubuntu/bionic64'
??? default: URL: https://vagrantcloud.com/ubuntu/bionic64
The box you're attempting to add doesn't support the provider
you requested. Please find an alternate box or use an alternate
provider. Double-check your requested provider to verify you didn't
simply misspell it.

If you're adding a box from HashiCorp's Vagrant Cloud, make sure the box is
released.

Name: ubuntu/bionic64
Address: https://vagrantcloud.com/ubuntu/bionic64
Requested provider: [:libvirt]

```

You can also search for boxes on the Vagrant website. They also show
which providers are supported:

https://app.vagrantup.com/ubuntu/boxes/bionic64

https://app.vagrantup.com/generic/boxes/ubuntu1804

I will also contact Ubuntu to ask them if they're willing to support
Libvirt, but in the mean time I suggest to choose a different box for
Buildroot on Vagrant using the Libvirt provider.

I will also fix the indentation as requested. This is probably due to my
vim settings.

Best regards,

Christopher

On 13/04/2019 22:21, Thomas Petazzoni wrote:
> Hello Christopher,
>
> Sorry for the very long delay in replying. I am not an expert with the
> Vagrant stuff, so I'm adding Angelo in Cc who hopefully will be able to
> comment further. Still, I have a few comments.
>
> First, the commit title should be:
>
> 	support/misc/Vagrantfile: add libvirt/kvm support
>
> On Fri, 15 Feb 2019 18:36:07 +0100
> Christopher Peeters <christopher@lecroq.be> wrote:
>
>> Signed-off-by: Christopher Peeters <christopher@lecroq.be>
>> ---
>>  support/misc/Vagrantfile | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
>> index 1ca5edc647..48f01a5807 100644
>> --- a/support/misc/Vagrantfile
>> +++ b/support/misc/Vagrantfile
>> @@ -29,6 +29,12 @@ Vagrant.configure('2') do |config|
>>  		end
>>  	end
>>  
>> +  config.vm.provider :libvirt do |v, override|
>> +    override.vm.box = 'generic/ubuntu1804'
> Why are you overriding the distribution being used? It seems odd that
> depending on the virtualization technology, a different distribution
> gets installed inside the VM.
>
>> +    v.memory = VM_MEMORY
>> +    v.cpus = VM_CORES
>> +  end 
> The indentation is also bogus: the file uses tabs, and you used two
> spaces. Could you fix that up ?
>
> Thanks,
>
> Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pEpkey.asc
Type: application/pgp-keys
Size: 1774 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190415/dc20a381/attachment.key>
