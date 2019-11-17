From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 20:40:48 +0100
Subject: [Buildroot] [PATCH 1/1] support/testing: add lxc test
In-Reply-To: <20191109150546.7b5d8de0@windsurf>
References: <20191107164804.30773-1-patrick.havelange@essensium.com>
 <20191109150546.7b5d8de0@windsurf>
Message-ID: <7a98da86-dba2-d1e0-3e13-18fd9b7c6d34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/11/2019 15:05, Thomas Petazzoni wrote:
> Hello Patrick,
> 
> On Thu,  7 Nov 2019 17:48:04 +0100
> Patrick Havelange <patrick.havelange@essensium.com> wrote:
> 
>> The test starts a simple container with an iperf3 server.
>> The container is using the tini init system, with a shared rootfs.
>> An iperf3 client is started from the host to check that the container
>> is really up and running.
>>
>> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> 
> Thanks for your contribution. I don't have a lot of very definitive
> feedback, more some general thoughts.
> 
> First of all, what was the idea behind the use of iperf3 ? Is it just a
> mean to make sure that both the container and host can communicate, and
> that the container runs fine ?

 Indeed. The container running is a bit limited for a test. Having network
access to it is a way to get a bit more confidence that it is really functional.

 ssh would be another option to test the network access, but is more complicated.

 nc also sounds like an obvious alternative, but that turns out to be
surprisingly difficult to set up correctly (in particular, reliably detecting
failure and not just timing out).

 That's why Patrick choose iperf, because it is really trivial.


> Another question is about the shared rootfs situation: if I understand
> correctly, the container runs with the same rootfs as the host.
> Recently, Carlos Santos (in Cc), submitted a patch "package/test-vm: a
> virtual machine image to  test libvirt", which builds a separate rootfs
> image to run as a VM using libvirt. Shouldn't we standardize a bit how
> the test cases will test things such as lxc/libvirt, and try to use
> more or less the same strategy/logic to build the image executed inside
> the container or VM ?

 The idea would be to add several lxc tests, for the different use cases. One of
the use cases is a shared rootfs, another is a separate rootfs. test-vm could be
used for the second case. Another useful case will be with systemd inside and
outisde the container and being sure that they can talk to each other properly.


> Note: this comment is really to open up the discussion on this topic.
> Perhaps we will decide that what you did is good enough, and can
> possibly be improved later.
> 
>> +    def run_ok(self, cmd):
>> +        full_cmd = "sh -c '{}'".format(cmd)
> 
> Why is running through "sh -c" necessary ?

 Good question. Probably a leftover from when some commands were using redirection?


>> +        out, exit_code = self.emulator.run(full_cmd, 120)
>> +        self.assertEqual(exit_code, 0)
> 
> This seems like a useful helper method, perhaps we should have it in
> the emulator class, and make use of it in other tests ?

 Indeed, that could be useful.

 But then it should probably be called assertRunOk, similar to assertEqual. And
that again requires a noqa marking :-(

 Regards,
 Arnout
