From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 22:33:32 +0100
Subject: [Buildroot] Buildroot defconfigs now being built on Travis CI
Message-ID: <20151123223332.3eff11d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I used to build the Buildroot defconfigs with a Jenkins instance
provided by Free Electrons, but with the increasing number of
defconfigs, it started to take too much time on our build server (and
therefore less CPU time was available for autobuild.b.o testing).

So, I've moved the testing of the Buildroot defconfigs to Travis CI,
which provides essentially free CPU time to allow open-source projects
to do continuous integration.

You can see the results at:

  https://travis-ci.org/buildroot/buildroot-defconfig-testing

The last build has been fully successful, with all 95 defconfigs
building fine. I have scheduled to rebuild all defconfigs every two
days, of course only if commits have been made to Buildroot.

For the moment, notifications of build working fine or failing are just
sent to some testing IRC channel. Once the mechanism has proven to work
well for a week or two, I'll adjust the notifications so that they are
sent to the official #buildroot IRC channel, and possibly by e-mail as
well (to the mailing list or directly to interested people).
Suggestions on this are welcome.

Now, if you want the gory details of how this is implemented:

In Travis, projects are directly connected to a Github repository. The
buildroot-defconfig-testing project is not connected directly to the
Buildroot Github repository. Instead, I have created a small
intermediate project, at
https://github.com/buildroot/buildroot-defconfig-testing, which
contains the .travis.yml file (for those who don't know Travis, this is
where you describe what your continuous integration tests should do).

In this repository, a shell script called update.sh pulls the latest
Buildrooot Git repository, and updates the .travis.yml to account for
changes in the list of available defconfigs, and to adjust the
Buildroot commit to be tested. It then pushed the result, which
triggers the Travis build. This script is executed every two days,
which is how the builds get triggered.

Do not hesitate to ask if you have any questions about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
