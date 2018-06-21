From: Martin Bark <martin@barkynet.com>
Date: Thu, 21 Jun 2018 23:04:25 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <20180618163931.4531ccb3@windsurf>
References: <20180616220601.4629-1-martin@barkynet.com>
 <20180616220601.4629-2-martin@barkynet.com>
 <20180617212547.4bc868c3@windsurf>
 <CAFGQKxeOmRCBUu7XFCDkpRbFV51F0=A8htjRMc75rKQA8_VtoQ@mail.gmail.com>
 <20180618163931.4531ccb3@windsurf>
Message-ID: <CAFGQKxcC+jryJo8RBHU00ATeRqMqmbTn_+4jcgHqj+_=kH0mLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 18 June 2018 at 15:39, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 18 Jun 2018 10:51:34 +0100, Martin Bark wrote:
>
>> > output/target$ ls -l etc/ssl/certs/128805a3.0
>> > lrwxrwxrwx 1 thomas thomas 35 Jun 17 20:58 etc/ssl/certs/128805a3.0 -> EE_Certification_Centre_Root_CA.pem
>>
>> Did you check other hashes under etc/ssl/certs/ ? Check for any hashes
>> that link to ca-certificates.crt. I suspect you have a different hash
>> pointing to ca-certificates.
>
> There are no files in /etc/ssl/certs that are symlinks to
> ca-certificates.crt:
>
> output/target$ ls -l etc/ssl/certs/| grep ca-certificates.crt
> -rw-r--r-- 1 thomas thomas 207436 Jun 18 15:30 ca-certificates.crt

I did some more testing and found sometimes by chance it does work,
however, i was able to reproduce the issue as follows

 docker run -it --rm buildroot/base:20180318.1724 bash
 git clone git://git.busybox.net/buildroot
 cd buildroot
 make olddefconfig
 make ca-certificates

you will see an output like this at the end of the build

 # Create symlinks to the certificates by their hash values
 /home/br-user/buildroot/output/host/bin/c_rehash
/home/br-user/buildroot/output/target/etc/ssl/certs
 Doing /home/br-user/buildroot/output/target/etc/ssl/certs
 WARNING: Skipping duplicate certificate OpenTrust_Root_CA_G1.pem

and one the the hashes will be wrong

 $ ls -l output/target/etc/ssl/certs/| grep ca-certificates.crt
 lrwxrwxrwx 1 br-user br-user     19 Jun 21 21:52 87229d21.0 ->
ca-certificates.crt

the incorrect hash is the one mentioned in the warning

 $ ls -l /etc/ssl/certs/87229d21.0
 lrwxrwxrwx 1 root root 24 Mar 18 16:30 /etc/ssl/certs/87229d21.0 ->
OpenTrust_Root_CA_G1.pem

The key issue is the

  WARNING: Skipping duplicate certificate xxxxx

where xxxx is the name of one of the files under etc/ssl/certs.
Sometimes it's ca-certificates.crt and hence you don't see any issue
(as you found).  Sometime it's one of the CA files which is the bug
i'm trying to fix.  You can run c_rehash directly

 ./output/host/bin/c_rehash ./output/target/etc/ssl/certs

and you will see the warning.  If you rm
output/target/etc/ssl/certs/ca-certificates.crt and try again then the
warning will go.

I had not released quite how random the bug.  It certainly is not
always EE_Certification_Centre_Root_CA.pem, it can be any CA that goes
wrong.  The commit message could be changed to make it clearer the bug
does not allows happen to EE_Certification_Centre_Root_CA.pem but i'm
100% sure this is a bug that needs fixing.

Thanks

Martin

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
