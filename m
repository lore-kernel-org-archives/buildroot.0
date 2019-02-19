From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 08:24:37 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libb64: fix
 integer overflow and uninitialized C++ objects
Message-ID: <20190219072403.84F018B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716f7a9759991b0ff5c971d70c0a72954fbef33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes a runtime bug on compilers where unsigned char is the default.
Fixes a runtime bug where _state variable in the encoder and decoder
c++ objects where not initialized by the constructors.

Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d76bde1a9b1e15f435b9070ee338be393f0f893)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libb64/0001-Integer-overflows.patch      | 73 ++++++++++++++++++++++++
 package/libb64/0002-Initialize-C++-objects.patch | 38 ++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/package/libb64/0001-Integer-overflows.patch b/package/libb64/0001-Integer-overflows.patch
new file mode 100644
index 0000000000..0e3e08b142
--- /dev/null
+++ b/package/libb64/0001-Integer-overflows.patch
@@ -0,0 +1,73 @@
+Fix integer overflows. Will not work on compilers with unsigned char
+as the default.
+
+Fetched from: https://sources.debian.org/patches/libb64/1.2-5/
+
+Combined "integer overflows.diff" and "off by one.diff" and adapted
+for version 1.2.1.
+
+Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
+
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
diff --git a/package/libb64/0002-Initialize-C++-objects.patch b/package/libb64/0002-Initialize-C++-objects.patch
new file mode 100644
index 0000000000..1556f889d1
--- /dev/null
+++ b/package/libb64/0002-Initialize-C++-objects.patch
@@ -0,0 +1,38 @@
+Fixes uninitialized C++ encoder and decoder _state variable bug.
+
+Fetched from: https://sources.debian.org/patches/libb64/1.2-5/
+
+initialize-coder-state.diff patch without modifications.
+
+Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
+
+diff --git a/include/b64/decode.h b/include/b64/decode.h
+index 12b16ea..d3f7d60 100644
+--- a/include/b64/decode.h
++++ b/include/b64/decode.h
+@@ -24,7 +24,9 @@ namespace base64
+ 
+ 		decoder(int buffersize_in = BUFFERSIZE)
+ 		: _buffersize(buffersize_in)
+-		{}
++		{
++			base64_init_decodestate(&_state);
++		}
+ 
+ 		int decode(char value_in)
+ 		{
+diff --git a/include/b64/encode.h b/include/b64/encode.h
+index 5d807d9..49aafdc 100644
+--- a/include/b64/encode.h
++++ b/include/b64/encode.h
+@@ -24,7 +24,9 @@ namespace base64
+ 
+ 		encoder(int buffersize_in = BUFFERSIZE)
+ 		: _buffersize(buffersize_in)
+-		{}
++		{
++			base64_init_encodestate(&_state);
++		}
+ 
+ 		int encode(char value_in)
+ 		{
