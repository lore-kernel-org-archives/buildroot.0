From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 13:53:26 +0100
Subject: [Buildroot] [git commit] package/runc: add upstream security
 fix for CVE-2019-5736
In-Reply-To: <20190212190320.2006188F2E@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 12 Feb 2019 20:04:14 +0100")
References: <20190212190320.2006188F2E@busybox.osuosl.org>
Message-ID: <87lg29s3p5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6e3f7fbc072c88ab344f2ffa39e402464b566f19
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The vulnerability allows a malicious container to (with minimal user
 > interaction) overwrite the host runc binary and thus gain root-level
 > code execution on the host. The level of user interaction is being able
 > to run any command (it doesn't matter if the command is not
 > attacker-controlled) as root within a container in either of these
 > contexts:

 >   * Creating a new container using an attacker-controlled image.
 >   * Attaching (docker exec) into an existing container which the
 >     attacker had previous write access to.

 > For more details, see the advisory:

 > https://www.openwall.com/lists/oss-security/2019/02/11/2

 > The fix for this issue uses fexecve(3), which isn't available on uClibc, so
 > add a dependency on !uclibc to runc and propagate to the reverse
 > dependencies (containerd/docker-engine).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

I have so far NOT backported it to 2018.02.x as it requires a bump of
the entire docker stack, and given that 2018.02 is very close to EOL I
suggest affected users (using docker on a writable rootfs with untrusted
containers) instead move to 2019.02.

-- 
Bye, Peter Korsgaard
