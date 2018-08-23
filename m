From: Mikael Eliasson <mikael@robomagi.com>
Date: Thu, 23 Aug 2018 12:39:30 +0200
Subject: [Buildroot] [PATCH 6/6] libb64: Fix integer overflow and
 uninitialized C++ objects.
Message-ID: <20180823103930.5112-1-mikael@robomagi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
---
 package/libb64/0001-Integer-overflows.patch | 68 +++++++++++++++++++++
 package/libb64/libb64.hash                  |  1 +
 package/libb64/libb64.mk                    |  1 +
 3 files changed, 70 insertions(+)
 create mode 100644 package/libb64/0001-Integer-overflows.patch

diff --git a/package/libb64/0001-Integer-overflows.patch b/package/libb64/0001-Integer-overflows.patch
new file mode 100644
index 0000000000..ea25bb7dd3
--- /dev/null
+++ b/package/libb64/0001-Integer-overflows.patch
@@ -0,0 +1,68 @@
+Fix integer overflows.
+Fetch from: https://sources.debian.org/patches/libb64/1.2-5/
+Combined "integer overflows.diff" and "off by one.diff" and adapted for version 1.2.1.
+
+Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
+diff --git a/src/cdecode.c b/src/cdecode.c
+index a6c0a42..45da4e1 100644
+--- a/src/cdecode.c
++++ b/src/cdecode.c
+@@ -9,10 +9,11 @@ For details, see http://sourceforge.net/projects/libb64
+ 
+ int base64_decode_value(char value_in)
+ {
+-	static const char decoding[] = {62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-2,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51};
++	static const signed char decoding[] = {62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-2,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51};
+ 	static const char decoding_size = sizeof(decoding);
++	if (value_in < 43) return -1;
+ 	value_in -= 43;
+-	if (value_in < 0 || value_in >= decoding_size) return -1;
++	if (value_in >= decoding_size) return -1;
+ 	return decoding[(int)value_in];
+ }
+ 
+@@ -26,7 +27,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ {
+ 	const char* codechar = code_in;
+ 	char* plainchar = plaintext_out;
+-	char fragment;
++	int fragment;
+ 	
+ 	*plainchar = state_in->plainchar;
+ 	
+@@ -42,7 +43,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar    = (fragment & 0x03f) << 2;
+ 	case step_b:
+@@ -53,7 +54,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar++ |= (fragment & 0x030) >> 4;
+ 			*plainchar    = (fragment & 0x00f) << 4;
+@@ -65,7 +66,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar++ |= (fragment & 0x03c) >> 2;
+ 			*plainchar    = (fragment & 0x003) << 6;
+@@ -77,7 +78,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar++   |= (fragment & 0x03f);
+ 		}
diff --git a/package/libb64/libb64.hash b/package/libb64/libb64.hash
index 0ed8065f12..f3a997cac6 100644
--- a/package/libb64/libb64.hash
+++ b/package/libb64/libb64.hash
@@ -1,6 +1,7 @@
 # sha1 from sourceforge, sha256 locally computed
 sha1  04b3e21b8c951d27f02fe91249ca3474554af0b9  libb64-1.2.1.zip
 sha256  20106f0ba95cfd9c35a13c71206643e3fb3e46512df3e2efb2fdbf87116314b2  libb64-1.2.1.zip
+sha256	e969d00eb18fbd2d0a2e09b293f118afc70d9ced121b55743d764e849c4fecac  initialize-coder-state.diff
 
 # Hash for license file:
 sha256  834b7afa1b3c40289a3be775d3625016be1c0d7ea7a4a26c1eb207f53dc961d8  LICENSE
diff --git a/package/libb64/libb64.mk b/package/libb64/libb64.mk
index ed6d3cf4b4..c18921502b 100644
--- a/package/libb64/libb64.mk
+++ b/package/libb64/libb64.mk
@@ -7,6 +7,7 @@
 LIBB64_VERSION = 1.2.1
 LIBB64_SOURCE = libb64-$(LIBB64_VERSION).zip
 LIBB64_SITE = https://downloads.sourceforge.net/project/libb64/libb64/libb64
+LIBB64_PATCH = https://sources.debian.org/data/main/libb/libb64/1.2-5/debian/patches/initialize-coder-state.diff
 LIBB64_LICENSE = Public Domain
 LIBB64_LICENSE_FILES = LICENSE
 LIBB64_INSTALL_STAGING = YES
-- 
2.17.1
