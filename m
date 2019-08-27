From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Aug 2019 22:39:53 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lxc: security bump to
 version 3.2.1
In-Reply-To: <20190817215903.081b1e7a@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 17 Aug 2019 21:59:03 +0200")
References: <20190816170315.8763-1-fontaine.fabrice@gmail.com>
 <20190817154123.377b3d77@windsurf.home>
 <CAPi7W81xxDaUW8jK2tpNeE7uifZ5=S-U3mfZQ5t9fiWAwTeZSw@mail.gmail.com>
 <20190817215903.081b1e7a@windsurf.home>
Message-ID: <87blwajqau.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> > Does it make sense to backport just the security fix in master ?  
 >> I could but this fix will add the glibc or musl toolchain dependency.

 > OK, so let's bring Peter Korsgaard in Cc. Since he maintains the
 > stable/LTS branches, it is important to get his call on this issue.

Well, is is "complicated" ;) CVE-2019-5736 is the same issue we fixed
for runc back in February (where the fix had some fallout).

But do notice:

- Issue only applies to privileged containers, which is explicitly
  marked as unsafe by upstream - E.G. on their website:

  They're not safe at all and should only be used in environments where
  unprivileged containers aren't available and where you would trust
  your container's user with root access to the host.

  https://linuxcontainers.org/lxc/security/#LXC

- The current lxc version in 2019.02.x / 2019.05.x / 2019.08 is 3.1.0,
  which is a development version of late 2018.

- A fix is available for the current LTS version (3.0.x, supported until
  2023) and current development version (3.2.1)


So our options are basically:

- Apply the patch to master and 2019.02.x / 2019.05.x

- Revert master/2019.05.x/2019.02.x to the LTS series, 3.0.4

- Cherry pick the fix to 3.1.0 for master/2019.05.x/2019.02.x

- Ignore the issue and only apply the patch to next


I would say option 4 (ignore) or 2 (revert) sounds like the most
sensible options to me.

What do others think?

-- 
Bye, Peter Korsgaard
