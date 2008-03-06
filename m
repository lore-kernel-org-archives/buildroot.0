From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:38:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  xpdf
Message-ID: <20080306183805.48C791202A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:38:04 -0800 (Thu, 06 Mar 2008)
New Revision: 21244

Log:
added xpdf

Added:
   trunk/buildroot/package/xpdf/
   trunk/buildroot/package/xpdf/Config.in
   trunk/buildroot/package/xpdf/xpdf-3.02pl1.patch
   trunk/buildroot/package/xpdf/xpdf-3.02pl2.patch
   trunk/buildroot/package/xpdf/xpdf.mk


Changeset:
Added: trunk/buildroot/package/xpdf/Config.in
===================================================================
--- trunk/buildroot/package/xpdf/Config.in	                        (rev 0)
+++ trunk/buildroot/package/xpdf/Config.in	2008-03-06 18:38:04 UTC (rev 21244)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XPDF
+	bool "xpdf"
+	select BR2_PACKAGE_OPENMOTIF
+	default n
+	help
+	  Xpdf is an open source viewer for Portable Document Format (PDF) files.
+
+	  ftp://ftp.foolabs.com/pub/xpdf

Added: trunk/buildroot/package/xpdf/xpdf-3.02pl1.patch
===================================================================
--- trunk/buildroot/package/xpdf/xpdf-3.02pl1.patch	                        (rev 0)
+++ trunk/buildroot/package/xpdf/xpdf-3.02pl1.patch	2008-03-06 18:38:04 UTC (rev 21244)
@@ -0,0 +1,33 @@
+*** xpdf-3.02.orig/xpdf/Stream.cc	Tue Feb 27 14:05:52 2007
+--- xpdf-3.02/xpdf/Stream.cc	Thu Jul 26 14:44:43 2007
+***************
+*** 410,424 ****
+    ok = gFalse;
+  
+    nVals = width * nComps;
+-   if (width <= 0 || nComps <= 0 || nBits <= 0 ||
+-       nComps >= INT_MAX / nBits ||
+-       width >= INT_MAX / nComps / nBits ||
+-       nVals * nBits + 7 < 0) {
+-     return;
+-   }
+    pixBytes = (nComps * nBits + 7) >> 3;
+    rowBytes = ((nVals * nBits + 7) >> 3) + pixBytes;
+!   if (rowBytes <= 0) {
+      return;
+    }
+    predLine = (Guchar *)gmalloc(rowBytes);
+--- 410,422 ----
+    ok = gFalse;
+  
+    nVals = width * nComps;
+    pixBytes = (nComps * nBits + 7) >> 3;
+    rowBytes = ((nVals * nBits + 7) >> 3) + pixBytes;
+!   if (width <= 0 || nComps <= 0 || nBits <= 0 ||
+!       nComps > gfxColorMaxComps ||
+!       nBits > 16 ||
+!       width >= INT_MAX / nComps ||      // check for overflow in nVals 
+!       nVals >= (INT_MAX - 7) / nBits) { // check for overflow in rowBytes
+      return;
+    }
+    predLine = (Guchar *)gmalloc(rowBytes);

Added: trunk/buildroot/package/xpdf/xpdf-3.02pl2.patch
===================================================================
--- trunk/buildroot/package/xpdf/xpdf-3.02pl2.patch	                        (rev 0)
+++ trunk/buildroot/package/xpdf/xpdf-3.02pl2.patch	2008-03-06 18:38:04 UTC (rev 21244)
@@ -0,0 +1,823 @@
+diff -c -r xpdf-3.02pl1.orig/xpdf/Stream.cc xpdf-3.02/xpdf/Stream.cc
+*** xpdf-3.02pl1.orig/xpdf/Stream.cc	Thu Oct 25 15:47:38 2007
+--- xpdf-3.02/xpdf/Stream.cc	Thu Oct 25 15:48:19 2007
+***************
+*** 1243,1265 ****
+    columns = columnsA;
+    if (columns < 1) {
+      columns = 1;
+!   }
+!   if (columns + 4 <= 0) {
+!     columns = INT_MAX - 4;
+    }
+    rows = rowsA;
+    endOfBlock = endOfBlockA;
+    black = blackA;
+!   refLine = (short *)gmallocn(columns + 3, sizeof(short));
+!   codingLine = (short *)gmallocn(columns + 2, sizeof(short));
+  
+    eof = gFalse;
+    row = 0;
+    nextLine2D = encoding < 0;
+    inputBits = 0;
+!   codingLine[0] = 0;
+!   codingLine[1] = refLine[2] = columns;
+!   a0 = 1;
+  
+    buf = EOF;
+  }
+--- 1243,1268 ----
+    columns = columnsA;
+    if (columns < 1) {
+      columns = 1;
+!   } else if (columns > INT_MAX - 2) {
+!     columns = INT_MAX - 2;
+    }
+    rows = rowsA;
+    endOfBlock = endOfBlockA;
+    black = blackA;
+!   // 0 <= codingLine[0] < codingLine[1] < ... < codingLine[n] = columns
+!   // ---> max codingLine size = columns + 1
+!   // refLine has one extra guard entry at the end
+!   // ---> max refLine size = columns + 2
+!   codingLine = (int *)gmallocn(columns + 1, sizeof(int));
+!   refLine = (int *)gmallocn(columns + 2, sizeof(int));
+  
+    eof = gFalse;
+    row = 0;
+    nextLine2D = encoding < 0;
+    inputBits = 0;
+!   codingLine[0] = columns;
+!   a0i = 0;
+!   outputBits = 0;
+  
+    buf = EOF;
+  }
+***************
+*** 1278,1286 ****
+    row = 0;
+    nextLine2D = encoding < 0;
+    inputBits = 0;
+!   codingLine[0] = 0;
+!   codingLine[1] = columns;
+!   a0 = 1;
+    buf = EOF;
+  
+    // skip any initial zero bits and end-of-line marker, and get the 2D
+--- 1281,1289 ----
+    row = 0;
+    nextLine2D = encoding < 0;
+    inputBits = 0;
+!   codingLine[0] = columns;
+!   a0i = 0;
+!   outputBits = 0;
+    buf = EOF;
+  
+    // skip any initial zero bits and end-of-line marker, and get the 2D
+***************
+*** 1297,1507 ****
+    }
+  }
+  
+  int CCITTFaxStream::lookChar() {
+    short code1, code2, code3;
+!   int a0New;
+!   GBool err, gotEOL;
+!   int ret;
+!   int bits, i;
+  
+!   // if@eof just return EOF
+!   if (eof && codingLine[a0] >= columns) {
+!     return EOF;
+    }
+  
+    // read the next row
+!   err = gFalse;
+!   if (codingLine[a0] >= columns) {
+  
+      // 2-D encoding
+      if (nextLine2D) {
+-       // state:
+-       //   a0New = current position in coding line (0 <= a0New <= columns)
+-       //   codingLine[a0] = last change in coding line
+-       //                    (black-to-white if a0 is even,
+-       //                     white-to-black if a0 is odd)
+-       //   refLine[b1] = next change in reference line of opposite color
+-       //                 to a0
+-       // invariants:
+-       //   0 <= codingLine[a0] <= a0New
+-       //           <= refLine[b1] <= refLine[b1+1] <= columns
+-       //   0 <= a0 <= columns+1
+-       //   refLine[0] = 0
+-       //   refLine[n] = refLine[n+1] = columns
+-       //     -- for some 1 <= n <= columns+1
+-       // end condition:
+-       //   0 = codingLine[0] <= codingLine[1] < codingLine[2] < ...
+-       //     < codingLine[n-1] < codingLine[n] = columns
+-       //     -- where 1 <= n <= columns+1
+        for (i = 0; codingLine[i] < columns; ++i) {
+  	refLine[i] = codingLine[i];
+        }
+!       refLine[i] = refLine[i + 1] = columns;
+!       b1 = 1;
+!       a0New = codingLine[a0 = 0] = 0;
+!       do {
+  	code1 = getTwoDimCode();
+  	switch (code1) {
+  	case twoDimPass:
+! 	  if (refLine[b1] < columns) {
+! 	    a0New = refLine[b1 + 1];
+! 	    b1 += 2;
+  	  }
+  	  break;
+  	case twoDimHoriz:
+! 	  if ((a0 & 1) == 0) {
+! 	    code1 = code2 = 0;
+  	    do {
+! 	      code1 += code3 = getWhiteCode();
+  	    } while (code3 >= 64);
+  	    do {
+! 	      code2 += code3 = getBlackCode();
+  	    } while (code3 >= 64);
+  	  } else {
+- 	    code1 = code2 = 0;
+  	    do {
+! 	      code1 += code3 = getBlackCode();
+  	    } while (code3 >= 64);
+  	    do {
+! 	      code2 += code3 = getWhiteCode();
+  	    } while (code3 >= 64);
+  	  }
+! 	  if (code1 > 0 || code2 > 0) {
+! 	    if (a0New + code1 <= columns) {
+! 	      codingLine[a0 + 1] = a0New + code1;
+! 	    } else {
+! 	      codingLine[a0 + 1] = columns;
+! 	    }
+! 	    ++a0;
+! 	    if (codingLine[a0] + code2 <= columns) {
+! 	      codingLine[a0 + 1] = codingLine[a0] + code2;
+! 	    } else {
+! 	      codingLine[a0 + 1] = columns;
+! 	    }
+! 	    ++a0;
+! 	    a0New = codingLine[a0];
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+  	  }
+  	  break;
+! 	case twoDimVert0:
+! 	  if (refLine[b1] < columns) {
+! 	    a0New = codingLine[++a0] = refLine[b1];
+! 	    ++b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+- 	  } else {
+- 	    a0New = codingLine[++a0] = columns;
+  	  }
+  	  break;
+  	case twoDimVertR1:
+! 	  if (refLine[b1] + 1 < columns) {
+! 	    a0New = codingLine[++a0] = refLine[b1] + 1;
+! 	    ++b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+- 	  } else {
+- 	    a0New = codingLine[++a0] = columns;
+  	  }
+  	  break;
+! 	case twoDimVertL1:
+! 	  if (refLine[b1] - 1 > a0New || (a0 == 0 && refLine[b1] == 1)) {
+! 	    a0New = codingLine[++a0] = refLine[b1] - 1;
+! 	    --b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+  	  }
+  	  break;
+! 	case twoDimVertR2:
+! 	  if (refLine[b1] + 2 < columns) {
+! 	    a0New = codingLine[++a0] = refLine[b1] + 2;
+! 	    ++b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+- 	  } else {
+- 	    a0New = codingLine[++a0] = columns;
+  	  }
+  	  break;
+  	case twoDimVertL2:
+! 	  if (refLine[b1] - 2 > a0New || (a0 == 0 && refLine[b1] == 2)) {
+! 	    a0New = codingLine[++a0] = refLine[b1] - 2;
+! 	    --b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+! 	  }
+! 	  break;
+! 	case twoDimVertR3:
+! 	  if (refLine[b1] + 3 < columns) {
+! 	    a0New = codingLine[++a0] = refLine[b1] + 3;
+! 	    ++b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+- 	  } else {
+- 	    a0New = codingLine[++a0] = columns;
+  	  }
+  	  break;
+! 	case twoDimVertL3:
+! 	  if (refLine[b1] - 3 > a0New || (a0 == 0 && refLine[b1] == 3)) {
+! 	    a0New = codingLine[++a0] = refLine[b1] - 3;
+! 	    --b1;
+! 	    while (refLine[b1] <= a0New && refLine[b1] < columns) {
+! 	      b1 += 2;
+  	    }
+  	  }
+  	  break;
+  	case EOF:
+  	  eof = gTrue;
+! 	  codingLine[a0 = 0] = columns;
+! 	  return EOF;
+  	default:
+  	  error(getPos(), "Bad 2D code %04x in CCITTFax stream", code1);
+  	  err = gTrue;
+  	  break;
+  	}
+!       } while (codingLine[a0] < columns);
+  
+      // 1-D encoding
+      } else {
+!       codingLine[a0 = 0] = 0;
+!       while (1) {
+  	code1 = 0;
+! 	do {
+! 	  code1 += code3 = getWhiteCode();
+! 	} while (code3 >= 64);
+! 	codingLine[a0+1] = codingLine[a0] + code1;
+! 	++a0;
+! 	if (codingLine[a0] >= columns) {
+! 	  break;
+! 	}
+! 	code2 = 0;
+! 	do {
+! 	  code2 += code3 = getBlackCode();
+! 	} while (code3 >= 64);
+! 	codingLine[a0+1] = codingLine[a0] + code2;
+! 	++a0;
+! 	if (codingLine[a0] >= columns) {
+! 	  break;
+  	}
+        }
+      }
+  
+-     if (codingLine[a0] != columns) {
+-       error(getPos(), "CCITTFax row is wrong length (%d)", codingLine[a0]);
+-       // force the row to be the correct length
+-       while (codingLine[a0] > columns) {
+- 	--a0;
+-       }
+-       codingLine[++a0] = columns;
+-       err = gTrue;
+-     }
+- 
+      // byte-align the row
+      if (byteAlign) {
+        inputBits &= ~7;
+--- 1300,1529 ----
+    }
+  }
+  
++ inline void CCITTFaxStream::addPixels(int a1, int blackPixels) {
++   if (a1 > codingLine[a0i]) {
++     if (a1 > columns) {
++       error(getPos(), "CCITTFax row is wrong length (%d)", a1);
++       err = gTrue;
++       a1 = columns;
++     }
++     if ((a0i & 1) ^ blackPixels) {
++       ++a0i;
++     }
++     codingLine[a0i] = a1;
++   }
++ }
++ 
++ inline void CCITTFaxStream::addPixelsNeg(int a1, int blackPixels) {
++   if (a1 > codingLine[a0i]) {
++     if (a1 > columns) {
++       error(getPos(), "CCITTFax row is wrong length (%d)", a1);
++       err = gTrue;
++       a1 = columns;
++     }
++     if ((a0i & 1) ^ blackPixels) {
++       ++a0i;
++     }
++     codingLine[a0i] = a1;
++   } else if (a1 < codingLine[a0i]) {
++     if (a1 < 0) {
++       error(getPos(), "Invalid CCITTFax code");
++       err = gTrue;
++       a1 = 0;
++     }
++     while (a0i > 0 && a1 <= codingLine[a0i - 1]) {
++       --a0i;
++     }
++     codingLine[a0i] = a1;
++   }
++ }
++ 
+  int CCITTFaxStream::lookChar() {
+    short code1, code2, code3;
+!   int b1i, blackPixels, i, bits;
+!   GBool gotEOL;
+  
+!   if (buf != EOF) {
+!     return buf;
+    }
+  
+    // read the next row
+!   if (outputBits == 0) {
+! 
+!     // if at eof just return EOF
+!     if (eof) {
+!       return EOF;
+!     }
+! 
+!     err = gFalse;
+  
+      // 2-D encoding
+      if (nextLine2D) {
+        for (i = 0; codingLine[i] < columns; ++i) {
+  	refLine[i] = codingLine[i];
+        }
+!       refLine[i++] = columns;
+!       refLine[i] = columns;
+!       codingLine[0] = 0;
+!       a0i = 0;
+!       b1i = 0;
+!       blackPixels = 0;
+!       // invariant:
+!       // refLine[b1i-1] <= codingLine[a0i] < refLine[b1i] < refLine[b1i+1]
+!       //                                                             <= columns
+!       // exception at left edge:
+!       //   codingLine[a0i = 0] = refLine[b1i = 0] = 0 is possible
+!       // exception@right edge:
+!       //   refLine[b1i] = refLine[b1i+1] = columns is possible
+!       while (codingLine[a0i] < columns) {
+  	code1 = getTwoDimCode();
+  	switch (code1) {
+  	case twoDimPass:
+! 	  addPixels(refLine[b1i + 1], blackPixels);
+! 	  if (refLine[b1i + 1] < columns) {
+! 	    b1i += 2;
+  	  }
+  	  break;
+  	case twoDimHoriz:
+! 	  code1 = code2 = 0;
+! 	  if (blackPixels) {
+  	    do {
+! 	      code1 += code3 = getBlackCode();
+  	    } while (code3 >= 64);
+  	    do {
+! 	      code2 += code3 = getWhiteCode();
+  	    } while (code3 >= 64);
+  	  } else {
+  	    do {
+! 	      code1 += code3 = getWhiteCode();
+  	    } while (code3 >= 64);
+  	    do {
+! 	      code2 += code3 = getBlackCode();
+  	    } while (code3 >= 64);
+  	  }
+! 	  addPixels(codingLine[a0i] + code1, blackPixels);
+! 	  if (codingLine[a0i] < columns) {
+! 	    addPixels(codingLine[a0i] + code2, blackPixels ^ 1);
+! 	  }
+! 	  while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	    b1i += 2;
+! 	  }
+! 	  break;
+! 	case twoDimVertR3:
+! 	  addPixels(refLine[b1i] + 3, blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    ++b1i;
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+! 	case twoDimVertR2:
+! 	  addPixels(refLine[b1i] + 2, blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    ++b1i;
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+  	case twoDimVertR1:
+! 	  addPixels(refLine[b1i] + 1, blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    ++b1i;
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+! 	case twoDimVert0:
+! 	  addPixels(refLine[b1i], blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    ++b1i;
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+! 	case twoDimVertL3:
+! 	  addPixelsNeg(refLine[b1i] - 3, blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    if (b1i > 0) {
+! 	      --b1i;
+! 	    } else {
+! 	      ++b1i;
+! 	    }
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+  	case twoDimVertL2:
+! 	  addPixelsNeg(refLine[b1i] - 2, blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    if (b1i > 0) {
+! 	      --b1i;
+! 	    } else {
+! 	      ++b1i;
+  	    }
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+! 	case twoDimVertL1:
+! 	  addPixelsNeg(refLine[b1i] - 1, blackPixels);
+! 	  blackPixels ^= 1;
+! 	  if (codingLine[a0i] < columns) {
+! 	    if (b1i > 0) {
+! 	      --b1i;
+! 	    } else {
+! 	      ++b1i;
+! 	    }
+! 	    while (refLine[b1i] <= codingLine[a0i] && refLine[b1i] < columns) {
+! 	      b1i += 2;
+  	    }
+  	  }
+  	  break;
+  	case EOF:
++ 	  addPixels(columns, 0);
+  	  eof = gTrue;
+! 	  break;
+  	default:
+  	  error(getPos(), "Bad 2D code %04x in CCITTFax stream", code1);
++ 	  addPixels(columns, 0);
+  	  err = gTrue;
+  	  break;
+  	}
+!       }
+  
+      // 1-D encoding
+      } else {
+!       codingLine[0] = 0;
+!       a0i = 0;
+!       blackPixels = 0;
+!       while (codingLine[a0i] < columns) {
+  	code1 = 0;
+! 	if (blackPixels) {
+! 	  do {
+! 	    code1 += code3 = getBlackCode();
+! 	  } while (code3 >= 64);
+! 	} else {
+! 	  do {
+! 	    code1 += code3 = getWhiteCode();
+! 	  } while (code3 >= 64);
+  	}
++ 	addPixels(codingLine[a0i] + code1, blackPixels);
++ 	blackPixels ^= 1;
+        }
+      }
+  
+      // byte-align the row
+      if (byteAlign) {
+        inputBits &= ~7;
+***************
+*** 1560,1573 ****
+      // this if we know the stream contains end-of-line markers because
+      // the "just plow on" technique tends to work better otherwise
+      } else if (err && endOfLine) {
+!       do {
+  	if (code1 == EOF) {
+  	  eof = gTrue;
+  	  return EOF;
+  	}
+  	eatBits(1);
+! 	code1 = lookBits(13);
+!       } while ((code1 >> 1) != 0x001);
+        eatBits(12); 
+        if (encoding > 0) {
+  	eatBits(1);
+--- 1582,1598 ----
+      // this if we know the stream contains end-of-line markers because
+      // the "just plow on" technique tends to work better otherwise
+      } else if (err && endOfLine) {
+!       while (1) {
+! 	code1 = lookBits(13);
+  	if (code1 == EOF) {
+  	  eof = gTrue;
+  	  return EOF;
+  	}
++ 	if ((code1 >> 1) == 0x001) {
++ 	  break;
++ 	}
+  	eatBits(1);
+!       }
+        eatBits(12); 
+        if (encoding > 0) {
+  	eatBits(1);
+***************
+*** 1575,1585 ****
+        }
+      }
+  
+!     a0 = 0;
+!     outputBits = codingLine[1] - codingLine[0];
+!     if (outputBits == 0) {
+!       a0 = 1;
+!       outputBits = codingLine[2] - codingLine[1];
+      }
+  
+      ++row;
+--- 1600,1610 ----
+        }
+      }
+  
+!     // set up for output
+!     if (codingLine[0] > 0) {
+!       outputBits = codingLine[a0i = 0];
+!     } else {
+!       outputBits = codingLine[a0i = 1];
+      }
+  
+      ++row;
+***************
+*** 1587,1625 ****
+  
+    // get a byte
+    if (outputBits >= 8) {
+!     ret = ((a0 & 1) == 0) ? 0xff : 0x00;
+!     if ((outputBits -= 8) == 0) {
+!       ++a0;
+!       if (codingLine[a0] < columns) {
+! 	outputBits = codingLine[a0 + 1] - codingLine[a0];
+!       }
+      }
+    } else {
+      bits = 8;
+!     ret = 0;
+      do {
+        if (outputBits > bits) {
+! 	i = bits;
+! 	bits = 0;
+! 	if ((a0 & 1) == 0) {
+! 	  ret |= 0xff >> (8 - i);
+  	}
+! 	outputBits -= i;
+        } else {
+! 	i = outputBits;
+! 	bits -= outputBits;
+! 	if ((a0 & 1) == 0) {
+! 	  ret |= (0xff >> (8 - i)) << bits;
+  	}
+  	outputBits = 0;
+! 	++a0;
+! 	if (codingLine[a0] < columns) {
+! 	  outputBits = codingLine[a0 + 1] - codingLine[a0];
+  	}
+        }
+!     } while (bits > 0 && codingLine[a0] < columns);
+    }
+-   buf = black ? (ret ^ 0xff) : ret;
+    return buf;
+  }
+  
+--- 1612,1654 ----
+  
+    // get a byte
+    if (outputBits >= 8) {
+!     buf = (a0i & 1) ? 0x00 : 0xff;
+!     outputBits -= 8;
+!     if (outputBits == 0 && codingLine[a0i] < columns) {
+!       ++a0i;
+!       outputBits = codingLine[a0i] - codingLine[a0i - 1];
+      }
+    } else {
+      bits = 8;
+!     buf = 0;
+      do {
+        if (outputBits > bits) {
+! 	buf <<= bits;
+! 	if (!(a0i & 1)) {
+! 	  buf |= 0xff >> (8 - bits);
+  	}
+! 	outputBits -= bits;
+! 	bits = 0;
+        } else {
+! 	buf <<= outputBits;
+! 	if (!(a0i & 1)) {
+! 	  buf |= 0xff >> (8 - outputBits);
+  	}
++ 	bits -= outputBits;
+  	outputBits = 0;
+! 	if (codingLine[a0i] < columns) {
+! 	  ++a0i;
+! 	  outputBits = codingLine[a0i] - codingLine[a0i - 1];
+! 	} else if (bits > 0) {
+! 	  buf <<= bits;
+! 	  bits = 0;
+  	}
+        }
+!     } while (bits);
+!   }
+!   if (black) {
+!     buf ^= 0xff;
+    }
+    return buf;
+  }
+  
+***************
+*** 1661,1666 ****
+--- 1690,1698 ----
+    code = 0; // make gcc happy
+    if (endOfBlock) {
+      code = lookBits(12);
++     if (code == EOF) {
++       return 1;
++     }
+      if ((code >> 5) == 0) {
+        p = &whiteTab1[code];
+      } else {
+***************
+*** 1673,1678 ****
+--- 1705,1713 ----
+    } else {
+      for (n = 1; n <= 9; ++n) {
+        code = lookBits(n);
++       if (code == EOF) {
++ 	return 1;
++       }
+        if (n < 9) {
+  	code <<= 9 - n;
+        }
+***************
+*** 1684,1689 ****
+--- 1719,1727 ----
+      }
+      for (n = 11; n <= 12; ++n) {
+        code = lookBits(n);
++       if (code == EOF) {
++ 	return 1;
++       }
+        if (n < 12) {
+  	code <<= 12 - n;
+        }
+***************
+*** 1709,1717 ****
+    code = 0; // make gcc happy
+    if (endOfBlock) {
+      code = lookBits(13);
+      if ((code >> 7) == 0) {
+        p = &blackTab1[code];
+!     } else if ((code >> 9) == 0) {
+        p = &blackTab2[(code >> 1) - 64];
+      } else {
+        p = &blackTab3[code >> 7];
+--- 1747,1758 ----
+    code = 0; // make gcc happy
+    if (endOfBlock) {
+      code = lookBits(13);
++     if (code == EOF) {
++       return 1;
++     }
+      if ((code >> 7) == 0) {
+        p = &blackTab1[code];
+!     } else if ((code >> 9) == 0 && (code >> 7) != 0) {
+        p = &blackTab2[(code >> 1) - 64];
+      } else {
+        p = &blackTab3[code >> 7];
+***************
+*** 1723,1728 ****
+--- 1764,1772 ----
+    } else {
+      for (n = 2; n <= 6; ++n) {
+        code = lookBits(n);
++       if (code == EOF) {
++ 	return 1;
++       }
+        if (n < 6) {
+  	code <<= 6 - n;
+        }
+***************
+*** 1734,1739 ****
+--- 1778,1786 ----
+      }
+      for (n = 7; n <= 12; ++n) {
+        code = lookBits(n);
++       if (code == EOF) {
++ 	return 1;
++       }
+        if (n < 12) {
+  	code <<= 12 - n;
+        }
+***************
+*** 1747,1752 ****
+--- 1794,1802 ----
+      }
+      for (n = 10; n <= 13; ++n) {
+        code = lookBits(n);
++       if (code == EOF) {
++ 	return 1;
++       }
+        if (n < 13) {
+  	code <<= 13 - n;
+        }
+***************
+*** 1961,1966 ****
+--- 2011,2022 ----
+      // allocate a buffer for the whole image
+      bufWidth = ((width + mcuWidth - 1) / mcuWidth) * mcuWidth;
+      bufHeight = ((height + mcuHeight - 1) / mcuHeight) * mcuHeight;
++     if (bufWidth <= 0 || bufHeight <= 0 ||
++ 	bufWidth > INT_MAX / bufWidth / (int)sizeof(int)) {
++       error(getPos(), "Invalid image size in DCT stream");
++       y = height;
++       return;
++     }
+      for (i = 0; i < numComps; ++i) {
+        frameBuf[i] = (int *)gmallocn(bufWidth * bufHeight, sizeof(int));
+        memset(frameBuf[i], 0, bufWidth * bufHeight * sizeof(int));
+***************
+*** 3036,3041 ****
+--- 3092,3102 ----
+    }
+    scanInfo.firstCoeff = str->getChar();
+    scanInfo.lastCoeff = str->getChar();
++   if (scanInfo.firstCoeff < 0 || scanInfo.lastCoeff > 63 ||
++       scanInfo.firstCoeff > scanInfo.lastCoeff) {
++     error(getPos(), "Bad DCT coefficient numbers in scan info block");
++     return gFalse;
++   }
+    c = str->getChar();
+    scanInfo.ah = (c >> 4) & 0x0f;
+    scanInfo.al = c & 0x0f;
+diff -c -r xpdf-3.02pl1.orig/xpdf/Stream.h xpdf-3.02/xpdf/Stream.h
+*** xpdf-3.02pl1.orig/xpdf/Stream.h	Tue Feb 27 14:05:52 2007
+--- xpdf-3.02/xpdf/Stream.h	Thu Oct 25 15:48:15 2007
+***************
+*** 528,540 ****
+    int row;			// current row
+    int inputBuf;			// input buffer
+    int inputBits;		// number of bits in input buffer
+!   short *refLine;		// reference line changing elements
+!   int b1;			// index into refLine
+!   short *codingLine;		// coding line changing elements
+!   int a0;			// index into codingLine
+    int outputBits;		// remaining ouput bits
+    int buf;			// character buffer
+  
+    short getTwoDimCode();
+    short getWhiteCode();
+    short getBlackCode();
+--- 528,542 ----
+    int row;			// current row
+    int inputBuf;			// input buffer
+    int inputBits;		// number of bits in input buffer
+!   int *codingLine;		// coding line changing elements
+!   int *refLine;			// reference line changing elements
+!   int a0i;			// index into codingLine
+!   GBool err;			// error on current line
+    int outputBits;		// remaining ouput bits
+    int buf;			// character buffer
+  
++   void addPixels(int a1, int black);
++   void addPixelsNeg(int a1, int black);
+    short getTwoDimCode();
+    short getWhiteCode();
+    short getBlackCode();

Added: trunk/buildroot/package/xpdf/xpdf.mk
===================================================================
--- trunk/buildroot/package/xpdf/xpdf.mk	                        (rev 0)
+++ trunk/buildroot/package/xpdf/xpdf.mk	2008-03-06 18:38:04 UTC (rev 21244)
@@ -0,0 +1,31 @@
+#############################################################
+#
+# xpdf
+#
+#############################################################
+XPDF_VERSION = 3.02
+XPDF_SOURCE = xpdf-$(XPDF_VERSION).tar.gz
+XPDF_SITE = ftp://ftp.foolabs.com/pub/xpdf
+XPDF_AUTORECONF = NO
+XPDF_INSTALL_STAGING = NO
+XPDF_INSTALL_TARGET = YES
+XPDF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+XPDF_CONF_OPT = --enable-multithreaded 
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+	XPDF_CONF_OPT += --enable-fixedpoint
+endif
+
+ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+	XPDF_DEPENDENCIES += $(XSERVER) openmotif
+	XPDF_CONF_OPT += --with-Xm-library=$(STAGING_DIR)/usr/lib --with-Xm-includes=$(STAGING_DIR)/usr/include/Xm \
+					--with-x --with-freetype2-includes=$(STAGING_DIR)/usr/include \
+					--with-freetype2-library=$(STAGING_DIR)/usr/lib CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2" \
+					CXXFLAGS="-I$(STAGING_DIR)/usr/include/freetype2" 
+endif
+
+XPDF_DEPENDENCIES = uclibc freetype
+
+$(eval $(call AUTOTARGETS,package,xpdf))
+
