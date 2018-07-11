From: Kacper Kowalski <kacper.kowalski@lerta.energy>
Date: Wed, 11 Jul 2018 11:10:53 +0200
Subject: [Buildroot] Problem reinstalling a file with cmake-package after
 changes in menuconfig
Message-ID: <a2f3d7d3-2244-20ea-da80-00b4ccba0339@lerta.energy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I have simple string variable defined in my package like that in Config.in:

config BR2_PACKAGE_TESTPKG
 ??? bool "testpkg"
 ??? help
 ??? ? This is a test package.

if BR2_PACKAGE_TESTPKG
menu "configuration file"
config BR2_TEST_CONFIG_FILE
 ??? string "Test configuration file"
 ??? default ""

endmenu
endif


Then I pass the value of the variable like that in testpkg.mk:

...
TESTPKG_CONF_OPT += -DTEST_CONFIG_FILE=$(BR2_TEST_CONFIG_FILE)
...
$(eval $(cmake-package))


Finally in the CMakeLists.txt of the package:

...
install(FILES config-files/${TEST_CONFIG_FILE} DESTINATION 
some_target_destination RENAME config )

...


So to sum up in 'config-files' directory some configuration files are 
held. A user can choose which configuration file should be installed in 
the target image using 'make menuconfig' command.

When I set the string variable with value X and invoke build I can see 
that the file has been successfully installed on the target. The problem 
is that when I change the string variable to value Y invoke 'make 
testpkg-dirclean' and? then build the package again the file X persists 
and make install outputs 'Up-to-date' for that file. To force the file 
to be reinstalled I must remove manually the file 
'target/some_target_destination/config'.

Is is somewhat related to 'RENAME' option in 'install' command in 
CMakeLists.txt? What should I do to avoid such a behaviour?

Regards,

K. Kowalski.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180711/fcaffaf6/attachment.html>
