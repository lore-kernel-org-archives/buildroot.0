From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Aug 2012 14:06:22 +0200
Subject: [Buildroot] [PATCH v3 2/2] libglib2: fix install even if the
 host python binary refers to python3
In-Reply-To: <CAHXCMMLFnfw9qUaOcScsNKH10sS8JTHUBiRUHvNNKXT3dk69JQ@mail.gmail.com>
References: <1338674897-1810-1-git-send-email-s.martin49@gmail.com>
 <1338674897-1810-2-git-send-email-s.martin49@gmail.com>
 <20120717102211.0a8f59b9@skate>
 <CAHXCMMLFnfw9qUaOcScsNKH10sS8JTHUBiRUHvNNKXT3dk69JQ@mail.gmail.com>
Message-ID: <CAHXCMMKrACc1zJpBMFr6iPLPCH-YTbzV9X=tggLy4pQ_c=tXWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Reviving an old thread... ;-)

2012/7/17 Samuel Martin <s.martin49@gmail.com>:
> 2012/7/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> Le Sun,  3 Jun 2012 00:08:17 +0200,
>> Samuel Martin <s.martin49@gmail.com> a ?crit :
>>
>>> The libglib2's build system uses some python2 scripts in the install rules.
>>>
>>> This patch ensures to have a valid host python2 binary and enforces this python2
>>> binary at configure-time.
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> Isn't there a way to make the libglib2 python script python2 *and*
>> python3 compatible?
>>
> The truth is I have not checked that.
> Will do and report here.


Current state in BR, with or without host-python already installed:
- if host-python is already installed in the host directory, then
libglib2 found it; in this case PYTHON=$(HOST_DIR)/usr/bin/python, so
no problem (this is a side effect of the the way we set the PATH env.
var.).
- otherwise, libglib2 use the python binary from the system:
PYTHON=/usr/bin/python, which is wrong if /usr/bin/python points to
/usr/bin/python3.

With no host python2 found, the build error is:
[...]
Making all in tests
make[5]: Entering directory
`/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/tests'
UNINSTALLED_GLIB_SRCDIR=../.. \
	UNINSTALLED_GLIB_BUILDDIR=../.. \
	/usr/bin/python ../../gio/gdbus-2.0/codegen/gdbus-codegen \
	--interface-prefix org.project. \
	--generate-c-code gdbus-test-codegen-generated \
	--c-generate-object-manager \
	--c-namespace Foo_iGen \
	--generate-docbook gdbus-test-codegen-generated-doc \
	--annotate "org.project.Bar" Key1 Value1 \
	--annotate "org.project.Bar" org.gtk.GDBus.Internal Value2 \
	--annotate "org.project.Bar.HelloWorld()" Key3 Value3 \
	--annotate "org.project.Bar::TestSignal" Key4 Value4 \
	--annotate "org.project.Bar:ay" Key5 Value5 \
	--annotate "org.project.Bar.TestPrimitiveTypes()[val_int32]" Key6 Value6 \
	--annotate "org.project.Bar.TestPrimitiveTypes()[ret_uint32]" Key7 Value7 \
	--annotate "org.project.Bar::TestSignal[array_of_strings]" Key8 Value8 \
	./test-codegen.xml \
	
UNINSTALLED_GLIB_SRCDIR=../.. \
	UNINSTALLED_GLIB_BUILDDIR=../.. \
	/usr/bin/python ../../gio/gdbus-2.0/codegen/gdbus-codegen \
	--interface-prefix org.project. \
	--generate-c-code gdbus-test-codegen-generated \
	--c-generate-object-manager \
	--c-namespace Foo_iGen \
	--generate-docbook gdbus-test-codegen-generated-doc \
	--annotate "org.project.Bar" Key1 Value1 \
	--annotate "org.project.Bar" org.gtk.GDBus.Internal Value2 \
	--annotate "org.project.Bar.HelloWorld()" Key3 Value3 \
	--annotate "org.project.Bar::TestSignal" Key4 Value4 \
	--annotate "org.project.Bar:ay" Key5 Value5 \
	--annotate "org.project.Bar.TestPrimitiveTypes()[val_int32]" Key6 Value6 \
	--annotate "org.project.Bar.TestPrimitiveTypes()[ret_uint32]" Key7 Value7 \
	--annotate "org.project.Bar::TestSignal[array_of_strings]" Key8 Value8 \
	./test-codegen.xml \
	
Traceback (most recent call last):
  File "../../gio/gdbus-2.0/codegen/gdbus-codegen", line 41, in <module>
    sys.exit(codegen_main.codegen_main())
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/codegen_main.py",
line 171, in codegen_main
    parsed_ifaces = parser.parse_dbus_xml(xml_data)
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/parser.py",
line 289, in parse_dbus_xml
    parser = DBusXMLParser(xml_data)
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/parser.py",
line 57, in __init__
    self._parser.Parse(xml_data)
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/parser.py",
line 155, in handle_start_element
    if attrs.has_key('name') and self.doc_comment_last_symbol == attrs['name']:
AttributeError: 'dict' object has no attribute 'has_key'
make[5]: *** [gdbus-test-codegen-generated.c] Error 1
make[5]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "../../gio/gdbus-2.0/codegen/gdbus-codegen", line 41, in <module>
    sys.exit(codegen_main.codegen_main())
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/codegen_main.py",
line 171, in codegen_main
    parsed_ifaces = parser.parse_dbus_xml(xml_data)
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/parser.py",
line 289, in parse_dbus_xml
    parser = DBusXMLParser(xml_data)
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/parser.py",
line 57, in __init__
    self._parser.Parse(xml_data)
  File "/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen/parser.py",
line 155, in handle_start_element
    if attrs.has_key('name') and self.doc_comment_last_symbol == attrs['name']:
AttributeError: 'dict' object has no attribute 'has_key'
make[5]: *** [gdbus-test-codegen-generated.h] Error 1
make[5]: Leaving directory
`/home/samuel/data/workspace/src/buildroot/master/output/build/host-libglib2-2.30.2/gio/tests'


Current state in somewhere else:
Most of the time, other distros keep the dependency to python2 to
build glib2/gdbus-codegen, e.g.:
- archlinux (though the package has already been bumped to 2.32.4):
https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/glib2&id=614e5ff9b1c81454a96eebad2baf0ab7a803329b
- gentoo:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/glib/glib-2.30.2.ebuild?view=markup
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-util/gdbus-codegen/gdbus-codegen-2.30.2.ebuild?view=markup


Current state in glib repository:
A patch fixing this has quite recently been merged upstream (which is
already included in the glib release 2.32.4 or later, and works fine
with the current version integrated in BR: 2.30.2):
http://git.gnome.org/browse/glib/patch/?id=03611f7c0670ea14eedbc121972aed7ce60bb9ee


So, I'll send a patch integrating the upstream patch.
If this new patch is accepted, then this patch series (host-python2
and libglib2 depending on python2) could be discarded.


Cheers,

-- 
Sam
