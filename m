From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 22:35:51 +0200
Subject: [Buildroot] Problem reinstalling a file with cmake-package
 after changes in menuconfig
In-Reply-To: <a2f3d7d3-2244-20ea-da80-00b4ccba0339@lerta.energy>
References: <a2f3d7d3-2244-20ea-da80-00b4ccba0339@lerta.energy>
Message-ID: <ca7013fa-0332-69c0-bd7b-e04d29d5b82b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-18 11:10, Kacper Kowalski wrote:
> Hi!
> 
> I have simple string variable defined in my package like that in Config.in:
> 
> config BR2_PACKAGE_TESTPKG
> ??? bool "testpkg"
> ??? help
> ??? ? This is a test package.
> 
> if BR2_PACKAGE_TESTPKG
> menu "configuration file"
> config BR2_TEST_CONFIG_FILE
> ??? string "Test configuration file"
> ??? default ""
> 
> endmenu
> endif
> 
> 
> Then I pass the value of the variable like that in testpkg.mk:
> 
> ...
> TESTPKG_CONF_OPT += -DTEST_CONFIG_FILE=$(BR2_TEST_CONFIG_FILE)
> ...
> $(eval $(cmake-package))
> 
> 
> Finally in the CMakeLists.txt of the package:
> 
> ...
> install(FILES config-files/${TEST_CONFIG_FILE} DESTINATION
> some_target_destination RENAME config )
> 
> ...
> 
> 
> So to sum up in 'config-files' directory some configuration files are held. A
> user can choose which configuration file should be installed in the target image
> using 'make menuconfig' command.
> 
> When I set the string variable with value X and invoke build I can see that the
> file has been successfully installed on the target. The problem is that when I
> change the string variable to value Y invoke 'make testpkg-dirclean' and? then
> build the package again the file X persists and make install outputs
> 'Up-to-date' for that file. To force the file to be reinstalled I must remove
> manually the file 'target/some_target_destination/config'.

 This is really more a cmake question than a buildroot question. Buildroot
echoes the cmake invocation, so you can verify that -DTEST_CONFIG_FILE=Y really
is called in your second build.

 So I've tried to reproduce your issue, but I wasn't able to. When I call 'make
testpkg' twice, the second time it indeed says "Up-to-date". But if you force a
call to cmake again (either through 'make testpkg-dirclean' or 'make
testpkg-reconfigure') AND the TEST_CONFIG_FILE option has changed, it gets
overwritten.

 Regards,
 Arnout

> 
> Is is somewhat related to 'RENAME' option in 'install' command in
> CMakeLists.txt? What should I do to avoid such a behaviour?
> 
> Regards,
> 
> K. Kowalski.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
